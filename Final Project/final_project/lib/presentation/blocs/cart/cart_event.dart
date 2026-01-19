import 'package:equatable/equatable.dart';
import '../../../data/models/product_model.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object?> get props => [];
}

class LoadCart extends CartEvent {
  final String userId;

  const LoadCart(this.userId);

  @override
  List<Object?> get props => [userId];
}

class AddToCart extends CartEvent {
  final ProductModel product;
  final String userId;
  final String userName;

  const AddToCart({
    required this.product,
    required this.userId,
    required this.userName,
  });

  @override
  List<Object?> get props => [product, userId, userName];
}

class RemoveFromCart extends CartEvent {
  final int productId;
  final String userId;

  const RemoveFromCart({required this.productId, required this.userId});

  @override
  List<Object?> get props => [productId, userId];
}

class UpdateQuantity extends CartEvent {
  final int productId;
  final int quantity;
  final String userId;

  const UpdateQuantity({
    required this.productId,
    required this.quantity,
    required this.userId,
  });

  @override
  List<Object?> get props => [productId, quantity, userId];
}

class ClearCart extends CartEvent {
  final String userId;

  const ClearCart(this.userId);

  @override
  List<Object?> get props => [userId];
}
