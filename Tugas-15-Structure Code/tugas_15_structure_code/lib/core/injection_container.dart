import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:tugas_15_structure_code/data/datasources/comment_remote_data_source.dart';
import 'package:tugas_15_structure_code/data/datasources/post_remote_data_source.dart';
import 'package:tugas_15_structure_code/data/repositories/comment_repository_impl.dart';
import 'package:tugas_15_structure_code/data/repositories/post_repository_impl.dart';
import 'package:tugas_15_structure_code/domain/repositories/comment_repository.dart'
    as domain;
import 'package:tugas_15_structure_code/domain/repositories/post_repository.dart';
import 'package:tugas_15_structure_code/domain/usecases/get_comments_by_post_id.dart';
import 'package:tugas_15_structure_code/domain/usecases/get_posts.dart';
import 'package:tugas_15_structure_code/presentation/blocs/comment/comment_bloc.dart';
import 'package:tugas_15_structure_code/presentation/blocs/post/post_bloc.dart';

final sl = GetIt.instance;

void init() {
  // Bloc
  sl.registerFactory(() => PostBloc(getPosts: sl()));
  sl.registerFactory(() => CommentBloc(getCommentsByPostId: sl()));

  // Use cases
  sl.registerLazySingleton(() => GetPosts(sl()));
  sl.registerLazySingleton(() => GetCommentsByPostId(sl()));

  // Repository
  sl.registerLazySingleton<PostRepository>(
    () => PostRepositoryImpl(remoteDataSource: sl()),
  );
  sl.registerLazySingleton<domain.CommentRepository>(
    () => CommentRepositoryImpl(remoteDataSource: sl()),
  );

  // Data sources
  sl.registerLazySingleton<PostRemoteDataSource>(
    () => PostRemoteDataSourceImpl(dio: sl()),
  );
  sl.registerLazySingleton<CommentRemoteDataSource>(
    () => CommentRemoteDataSourceImpl(dio: sl()),
  );

  // External
  sl.registerLazySingleton(() => Dio());
}
