import 'package:tugas_15_structure_code/domain/entities/post.dart';
import 'package:tugas_15_structure_code/domain/repositories/post_repository.dart';

class GetPosts {
  final PostRepository repository;

  GetPosts(this.repository);

  Future<List<Post>> call({int page = 1, int limit = 10}) async {
    return await repository.getPosts(page: page, limit: limit);
  }
}
