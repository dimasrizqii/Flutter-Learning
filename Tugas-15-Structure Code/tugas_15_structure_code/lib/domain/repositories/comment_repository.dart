import 'package:tugas_15_structure_code/domain/entities/comment.dart';

abstract class CommentRepository {
  Future<List<Comment>> getCommentsByPostId(int postId);
}
