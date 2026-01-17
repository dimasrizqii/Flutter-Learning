import 'package:equatable/equatable.dart';
import '../../../data/models/product_model.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object?> get props => [];
}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final List<ProductModel> products;
  final List<String>? categories;

  const ProductLoaded(this.products, {this.categories});

  @override
  List<Object?> get props => [products, categories];
}

class ProductError extends ProductState {
  final String message;

  const ProductError(this.message);

  @override
  List<Object?> get props => [message];
}

class CategoriesLoaded extends ProductState {
  final List<String> categories;

  const CategoriesLoaded(this.categories);

  @override
  List<Object?> get props => [categories];
}

class ProductDetailLoaded extends ProductState {
  final ProductModel product;

  const ProductDetailLoaded(this.product);

  @override
  List<Object?> get props => [product];
}
