import 'package:equatable/equatable.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object?> get props => [];
}

class LoadAllProducts extends ProductEvent {}

class LoadProductsByCategory extends ProductEvent {
  final String category;

  const LoadProductsByCategory(this.category);

  @override
  List<Object?> get props => [category];
}

class LoadCategories extends ProductEvent {}

class LoadProductById extends ProductEvent {
  final int id;

  const LoadProductById(this.id);

  @override
  List<Object?> get props => [id];
}
