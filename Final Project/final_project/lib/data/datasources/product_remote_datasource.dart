import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product_model.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> getAllProducts();
  Future<List<ProductModel>> getProductsByCategory(String category);
  Future<List<String>> getCategories();
  Future<ProductModel> getProductById(int id);
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final http.Client client;
  static const String baseUrl = 'https://fakestoreapi.com';

  ProductRemoteDataSourceImpl({required this.client});

  @override
  Future<List<ProductModel>> getAllProducts() async {
    final response = await client.get(
      Uri.parse('$baseUrl/products'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((json) => ProductModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }

  @override
  Future<List<ProductModel>> getProductsByCategory(String category) async {
    final response = await client.get(
      Uri.parse('$baseUrl/products/category/$category'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((json) => ProductModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products by category');
    }
  }

  @override
  Future<List<String>> getCategories() async {
    final response = await client.get(
      Uri.parse('$baseUrl/products/categories'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((e) => e.toString()).toList();
    } else {
      throw Exception('Failed to load categories');
    }
  }

  @override
  Future<ProductModel> getProductById(int id) async {
    final response = await client.get(
      Uri.parse('$baseUrl/products/$id'),
    );

    if (response.statusCode == 200) {
      return ProductModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load product');
    }
  }
}
