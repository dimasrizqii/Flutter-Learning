import 'package:flutter_bloc/flutter_bloc.dart';
import '../controllers/post_controller.dart';
import 'post_event.dart';
import 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc({required PostController controller})
    : _controller = controller,
      super(const PostState()) {
    on<PostsFetched>(_onPostsFetched);
  }

  final PostController _controller;

  Future<void> _onPostsFetched(
    PostsFetched event,
    Emitter<PostState> emit,
  ) async {
    emit(state.copyWith(status: PostStatus.loading, cleanError: true));
    try {
      final posts = await _controller.fetchPosts();
      emit(
        state.copyWith(
          status: PostStatus.success,
          posts: posts,
          cleanError: true,
        ),
      );
    } catch (error) {
      emit(
        state.copyWith(
          status: PostStatus.failure,
          errorMessage: error.toString(),
        ),
      );
    }
  }
}
