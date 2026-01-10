import 'package:tugas_15_structure_code/domain/entities/post.dart';

abstract class PostRepository {
  Future<List<Post>> getPosts({int page = 1, int limit = 10});
}
