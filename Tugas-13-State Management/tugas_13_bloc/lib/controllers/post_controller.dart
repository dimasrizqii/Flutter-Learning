import 'package:dio/dio.dart';
import '../models/post_model.dart';

class PostController {
  PostController({Dio? dio})
    : _dio =
          dio ??
          Dio(
            BaseOptions(
              baseUrl: 'https://jsonplaceholder.typicode.com',
              connectTimeout: const Duration(seconds: 10),
              receiveTimeout: const Duration(seconds: 10),
              headers: <String, Object>{
                Headers.acceptHeader: Headers.jsonContentType,
                Headers.contentTypeHeader: Headers.jsonContentType,
              },
            ),
          );

  final Dio _dio;

  Future<List<PostModel>> fetchPosts() async {
    try {
      final response = await _dio.get<List<dynamic>>('/posts');
      final data = response.data;
      if (data == null) {
        throw const FormatException('Response body was empty');
      }
      return data
          .map(
            (dynamic json) => PostModel.fromJson(json as Map<String, dynamic>),
          )
          .toList();
    } on DioException catch (error) {
      final statusCode = error.response?.statusCode;
      final serverMessage =
          _extractServerMessage(error.response?.data) ??
          error.response?.statusMessage;
      final dioMessage = error.message ?? 'Unknown network error';
      final friendlyMessage = statusCode == null
          ? dioMessage
          : 'HTTP $statusCode${serverMessage != null ? ': $serverMessage' : ''}';
      throw Exception('Failed to fetch posts: $friendlyMessage');
    } on FormatException catch (error) {
      throw Exception('Invalid data received: ${error.message}');
    }
  }

  String? _extractServerMessage(dynamic data) {
    if (data is Map<String, dynamic>) {
      for (final key in ['message', 'error', 'detail']) {
        final value = data[key];
        if (value is String && value.isNotEmpty) {
          return value;
        }
      }
    }
    return null;
  }
}
