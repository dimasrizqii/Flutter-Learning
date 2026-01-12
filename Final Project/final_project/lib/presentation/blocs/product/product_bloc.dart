import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repositories/product_repository_impl.dart';
import 'product_event.dart';
import 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository productRepository;

  ProductBloc({required this.productRepository}) : super(ProductInitial()) {
    on<LoadAllProducts>(_onLoadAllProducts);
    on<LoadProductsByCategory>(_onLoadProductsByCategory);
    on<LoadCategories>(_onLoadCategories);
    on<LoadProductById>(_onLoadProductById);
  }

  Future<void> _onLoadAllProducts(
    LoadAllProducts event,
    Emitter<ProductState> emit,
  ) async {
    emit(ProductLoading());
    try {
      final products = await productRepository.getAllProducts();
      emit(ProductLoaded(products));
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }

  Future<void> _onLoadProductsByCategory(
    LoadProductsByCategory event,
    Emitter<ProductState> emit,
  ) async {
    emit(ProductLoading());
    try {
      final products = await productRepository.getProductsByCategory(
        event.category,
      );
      emit(ProductLoaded(products));
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }

  Future<void> _onLoadCategories(
    LoadCategories event,
    Emitter<ProductState> emit,
  ) async {
    emit(ProductLoading());
    try {
      final categories = await productRepository.getCategories();
      emit(CategoriesLoaded(categories));
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }

  Future<void> _onLoadProductById(
    LoadProductById event,
    Emitter<ProductState> emit,
  ) async {
    emit(ProductLoading());
    try {
      final product = await productRepository.getProductById(event.id);
      emit(ProductDetailLoaded(product));
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }
}
