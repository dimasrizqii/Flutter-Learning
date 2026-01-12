import '../datasources/product_remote_datasource.dart';
import '../models/product_model.dart';

abstract class ProductRepository {
  Future<List<ProductModel>> getAllProducts();
  Future<List<ProductModel>> getProductsByCategory(String category);
  Future<List<String>> getCategories();
  Future<ProductModel> getProductById(int id);
}

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;

  ProductRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<ProductModel>> getAllProducts() async {
    try {
      return await remoteDataSource.getAllProducts();
    } catch (e) {
      throw Exception('Failed to get products: $e');
    }
  }

  @override
  Future<List<ProductModel>> getProductsByCategory(String category) async {
    try {
      return await remoteDataSource.getProductsByCategory(category);
    } catch (e) {
      throw Exception('Failed to get products by category: $e');
    }
  }

  @override
  Future<List<String>> getCategories() async {
    try {
      return await remoteDataSource.getCategories();
    } catch (e) {
      throw Exception('Failed to get categories: $e');
    }
  }

  @override
  Future<ProductModel> getProductById(int id) async {
    try {
      return await remoteDataSource.getProductById(id);
    } catch (e) {
      throw Exception('Failed to get product: $e');
    }
  }
}
