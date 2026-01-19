import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class CartItem extends Equatable {
  final int productId;
  final String title;
  final double price;
  final String image;
  final int quantity;
  final String userId;
  final String userName;
  final DateTime createdAt;

  CartItem({
    required this.productId,
    required this.title,
    required this.price,
    required this.image,
    this.quantity = 1,
    required this.userId,
    required this.userName,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  CartItem copyWith({
    int? productId,
    String? title,
    double? price,
    String? image,
    int? quantity,
    String? userId,
    String? userName,
    DateTime? createdAt,
  }) {
    return CartItem(
      productId: productId ?? this.productId,
      title: title ?? this.title,
      price: price ?? this.price,
      image: image ?? this.image,
      quantity: quantity ?? this.quantity,
      userId: userId ?? this.userId,
      userName: userName ?? this.userName,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  double get subtotal => price * quantity;
  double get totalPrice => subtotal;
  double get unitPrice => price;

  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'title': title,
      'price': price,
      'image': image,
      'quantity': quantity,
      'userId': userId,
      'userName': userName,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      productId: json['productId'] as int,
      title: json['title'] as String,
      price: (json['price'] as num).toDouble(),
      image: json['image'] as String,
      quantity: json['quantity'] as int,
      userId: json['userId'] as String,
      userName: json['userName'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );
  }

  // Firestore-specific methods
  Map<String, dynamic> toFirestore() {
    return {
      'productId': productId,
      'title': title,
      'unitPrice': price,
      'totalPrice': totalPrice,
      'image': image,
      'quantity': quantity,
      'userId': userId,
      'userName': userName,
      'createdAt': Timestamp.fromDate(createdAt),
    };
  }

  factory CartItem.fromFirestore(Map<String, dynamic> data, String docId) {
    return CartItem(
      productId: data['productId'] as int,
      title: data['title'] as String,
      price: (data['unitPrice'] as num).toDouble(),
      image: data['image'] as String,
      quantity: data['quantity'] as int,
      userId: data['userId'] as String,
      userName: data['userName'] as String,
      createdAt: (data['createdAt'] as Timestamp).toDate(),
    );
  }

  @override
  List<Object?> get props => [
    productId,
    title,
    price,
    image,
    quantity,
    userId,
    userName,
    createdAt,
  ];
}
