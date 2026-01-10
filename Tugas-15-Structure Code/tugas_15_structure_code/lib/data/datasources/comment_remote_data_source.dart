import 'package:dio/dio.dart';
import 'package:tugas_15_structure_code/data/models/comment_model.dart';

abstract class CommentRemoteDataSource {
  Future<List<CommentModel>> getCommentsByPostId(int postId);
}

class CommentRemoteDataSourceImpl implements CommentRemoteDataSource {
  final Dio dio;

  CommentRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<CommentModel>> getCommentsByPostId(int postId) async {
    final response = await dio.get(
      'https://jsonplaceholder.typicode.com/posts/$postId/comments',
    );
    if (response.statusCode == 200) {
      final List<dynamic> data = response.data;
      return data.map((json) => CommentModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load comments');
    }
  }
}
