import 'package:tugas_15_structure_code/data/datasources/comment_remote_data_source.dart';
import 'package:tugas_15_structure_code/domain/entities/comment.dart';
import 'package:tugas_15_structure_code/domain/repositories/comment_repository.dart';

class CommentRepositoryImpl implements CommentRepository {
  final CommentRemoteDataSource remoteDataSource;

  CommentRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Comment>> getCommentsByPostId(int postId) async {
    final comments = await remoteDataSource.getCommentsByPostId(postId);
    return comments;
  }
}
