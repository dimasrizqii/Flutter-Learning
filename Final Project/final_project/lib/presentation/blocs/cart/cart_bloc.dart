import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/cart_item.dart';
import '../../../domain/repositories/cart_repository.dart';
import 'cart_event.dart';
import 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartRepository _cartRepository;

  CartBloc({required CartRepository cartRepository})
    : _cartRepository = cartRepository,
      super(const CartInitial()) {
    on<LoadCart>(_onLoadCart);
    on<AddToCart>(_onAddToCart);
    on<RemoveFromCart>(_onRemoveFromCart);
    on<UpdateQuantity>(_onUpdateQuantity);
    on<ClearCart>(_onClearCart);
  }

  Future<void> _onLoadCart(LoadCart event, Emitter<CartState> emit) async {
    emit(const CartLoading());
    try {
      final items = await _cartRepository.getCartItems(event.userId);
      final total = _calculateTotal(items);
      emit(CartLoaded(items: items, total: total));
    } catch (e) {
      emit(CartError('Failed to load cart: ${e.toString()}'));
    }
  }

  Future<void> _onAddToCart(AddToCart event, Emitter<CartState> emit) async {
    try {
      final currentState = state;
      List<CartItem> items = [];

      if (currentState is CartLoaded) {
        items = List.from(currentState.items);
      }

      final existingIndex = items.indexWhere(
        (item) => item.productId == event.product.id,
      );

      CartItem cartItem;
      if (existingIndex >= 0) {
        cartItem = items[existingIndex].copyWith(
          quantity: items[existingIndex].quantity + 1,
        );
        items[existingIndex] = cartItem;
      } else {
        cartItem = CartItem(
          productId: event.product.id,
          title: event.product.title,
          price: event.product.price,
          image: event.product.image,
          quantity: 1,
          userId: event.userId,
          userName: event.userName,
        );
        items.add(cartItem);
      }

      // Save to Firestore
      await _cartRepository.addCartItem(event.userId, cartItem);

      final total = _calculateTotal(items);
      emit(CartLoaded(items: items, total: total));
    } catch (e) {
      emit(CartError('Failed to add item to cart: ${e.toString()}'));
    }
  }

  Future<void> _onRemoveFromCart(
    RemoveFromCart event,
    Emitter<CartState> emit,
  ) async {
    try {
      final currentState = state;
      if (currentState is! CartLoaded) return;

      final items = List<CartItem>.from(currentState.items)
        ..removeWhere((item) => item.productId == event.productId);

      // Remove from Firestore
      await _cartRepository.removeCartItem(event.userId, event.productId);

      if (items.isEmpty) {
        emit(const CartInitial());
      } else {
        final total = _calculateTotal(items);
        emit(CartLoaded(items: items, total: total));
      }
    } catch (e) {
      emit(CartError('Failed to remove item from cart: ${e.toString()}'));
    }
  }

  Future<void> _onUpdateQuantity(
    UpdateQuantity event,
    Emitter<CartState> emit,
  ) async {
    try {
      final currentState = state;
      if (currentState is! CartLoaded) return;

      if (event.quantity <= 0) {
        add(RemoveFromCart(productId: event.productId, userId: event.userId));
        return;
      }

      final items = List<CartItem>.from(currentState.items);
      final index = items.indexWhere(
        (item) => item.productId == event.productId,
      );

      if (index >= 0) {
        final updatedItem = items[index].copyWith(quantity: event.quantity);
        items[index] = updatedItem;

        // Update in Firestore
        await _cartRepository.updateCartItem(event.userId, updatedItem);

        final total = _calculateTotal(items);
        emit(CartLoaded(items: items, total: total));
      }
    } catch (e) {
      emit(CartError('Failed to update item quantity: ${e.toString()}'));
    }
  }

  Future<void> _onClearCart(ClearCart event, Emitter<CartState> emit) async {
    try {
      await _cartRepository.clearCart(event.userId);
      emit(const CartInitial());
    } catch (e) {
      emit(CartError('Failed to clear cart: ${e.toString()}'));
    }
  }

  double _calculateTotal(List<CartItem> items) {
    return items.fold(0.0, (sum, item) => sum + item.subtotal);
  }
}
