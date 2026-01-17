import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/cart_item.dart';
import 'cart_event.dart';
import 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(const CartInitial()) {
    on<AddToCart>(_onAddToCart);
    on<RemoveFromCart>(_onRemoveFromCart);
    on<UpdateQuantity>(_onUpdateQuantity);
    on<ClearCart>(_onClearCart);
  }

  void _onAddToCart(AddToCart event, Emitter<CartState> emit) {
    final currentState = state;
    List<CartItem> items = [];

    if (currentState is CartLoaded) {
      items = List.from(currentState.items);
    }

    final existingIndex = items.indexWhere(
      (item) => item.productId == event.product.id,
    );

    if (existingIndex >= 0) {
      items[existingIndex] = items[existingIndex].copyWith(
        quantity: items[existingIndex].quantity + 1,
      );
    } else {
      items.add(
        CartItem(
          productId: event.product.id,
          title: event.product.title,
          price: event.product.price,
          image: event.product.image,
          quantity: 1,
        ),
      );
    }

    final total = _calculateTotal(items);
    emit(CartLoaded(items: items, total: total));
  }

  void _onRemoveFromCart(RemoveFromCart event, Emitter<CartState> emit) {
    final currentState = state;
    if (currentState is! CartLoaded) return;

    final items = List<CartItem>.from(currentState.items)
      ..removeWhere((item) => item.productId == event.productId);

    if (items.isEmpty) {
      emit(const CartInitial());
    } else {
      final total = _calculateTotal(items);
      emit(CartLoaded(items: items, total: total));
    }
  }

  void _onUpdateQuantity(UpdateQuantity event, Emitter<CartState> emit) {
    final currentState = state;
    if (currentState is! CartLoaded) return;

    if (event.quantity <= 0) {
      add(RemoveFromCart(event.productId));
      return;
    }

    final items = List<CartItem>.from(currentState.items);
    final index = items.indexWhere((item) => item.productId == event.productId);

    if (index >= 0) {
      items[index] = items[index].copyWith(quantity: event.quantity);
      final total = _calculateTotal(items);
      emit(CartLoaded(items: items, total: total));
    }
  }

  void _onClearCart(ClearCart event, Emitter<CartState> emit) {
    emit(const CartInitial());
  }

  double _calculateTotal(List<CartItem> items) {
    return items.fold(0.0, (sum, item) => sum + item.subtotal);
  }
}
