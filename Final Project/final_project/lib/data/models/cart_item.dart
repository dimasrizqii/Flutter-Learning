import 'package:equatable/equatable.dart';

class CartItem extends Equatable {
  final int productId;
  final String title;
  final double price;
  final String image;
  final int quantity;

  const CartItem({
    required this.productId,
    required this.title,
    required this.price,
    required this.image,
    this.quantity = 1,
  });

  CartItem copyWith({
    int? productId,
    String? title,
    double? price,
    String? image,
    int? quantity,
  }) {
    return CartItem(
      productId: productId ?? this.productId,
      title: title ?? this.title,
      price: price ?? this.price,
      image: image ?? this.image,
      quantity: quantity ?? this.quantity,
    );
  }

  double get subtotal => price * quantity;

  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'title': title,
      'price': price,
      'image': image,
      'quantity': quantity,
    };
  }

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      productId: json['productId'] as int,
      title: json['title'] as String,
      price: (json['price'] as num).toDouble(),
      image: json['image'] as String,
      quantity: json['quantity'] as int,
    );
  }

  @override
  List<Object?> get props => [productId, title, price, image, quantity];
}
