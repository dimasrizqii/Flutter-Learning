import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tugas_15_structure_code/domain/entities/post.dart';
import 'package:tugas_15_structure_code/domain/usecases/get_posts.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final GetPosts getPosts;
  int _currentPage = 1;
  final int _postsPerPage = 10;
  final int _totalPosts = 100;

  int get currentPage => _currentPage;
  int get totalPages => (_totalPosts / _postsPerPage).ceil();

  PostBloc({required this.getPosts}) : super(PostInitial()) {
    on<FetchPosts>((event, emit) async {
      _currentPage = event.page;
      emit(PostLoading(_currentPage));
      try {
        final posts = await getPosts(page: _currentPage, limit: _postsPerPage);
        emit(
          PostLoaded(posts, currentPage: _currentPage, totalPages: totalPages),
        );
      } catch (e) {
        emit(PostError(e.toString()));
      }
    });
  }

  void goToNextPage() {
    if (_currentPage < totalPages) {
      add(FetchPosts(page: _currentPage + 1));
    }
  }

  void goToPreviousPage() {
    if (_currentPage > 1) {
      add(FetchPosts(page: _currentPage - 1));
    }
  }

  void refreshCurrentPage() {
    add(FetchPosts(page: _currentPage));
  }
}
