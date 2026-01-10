import 'package:tugas_15_structure_code/domain/entities/comment.dart';
import 'package:tugas_15_structure_code/domain/repositories/comment_repository.dart';

class GetCommentsByPostId {
  final CommentRepository repository;

  GetCommentsByPostId(this.repository);

  Future<List<Comment>> call(int postId) async {
    return await repository.getCommentsByPostId(postId);
  }
}
