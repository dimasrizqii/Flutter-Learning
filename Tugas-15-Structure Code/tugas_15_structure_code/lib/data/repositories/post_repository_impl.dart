import 'package:tugas_15_structure_code/data/datasources/post_remote_data_source.dart';
import 'package:tugas_15_structure_code/domain/entities/post.dart';
import 'package:tugas_15_structure_code/domain/repositories/post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  final PostRemoteDataSource remoteDataSource;

  PostRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Post>> getPosts({int page = 1, int limit = 10}) async {
    final posts = await remoteDataSource.getPosts(page: page, limit: limit);
    return posts;
  }
}
