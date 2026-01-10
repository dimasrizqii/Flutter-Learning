import 'package:dio/dio.dart';
import 'package:tugas_15_structure_code/data/models/post_model.dart';

abstract class PostRemoteDataSource {
  Future<List<PostModel>> getPosts({int page = 1, int limit = 10});
}

class PostRemoteDataSourceImpl implements PostRemoteDataSource {
  final Dio dio;

  PostRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<PostModel>> getPosts({int page = 1, int limit = 10}) async {
    final response = await dio.get(
      'https://jsonplaceholder.typicode.com/posts?_page=$page&_limit=$limit',
    );
    if (response.statusCode == 200) {
      final List<dynamic> data = response.data;
      return data.map((json) => PostModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }
}
