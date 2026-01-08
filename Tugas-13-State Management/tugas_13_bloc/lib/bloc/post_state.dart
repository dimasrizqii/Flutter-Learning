import '../models/post_model.dart';

enum PostStatus { initial, loading, success, failure }

class PostState {
  const PostState({
    this.status = PostStatus.initial,
    this.posts = const <PostModel>[],
    this.errorMessage,
  });

  final PostStatus status;
  final List<PostModel> posts;
  final String? errorMessage;

  PostState copyWith({
    PostStatus? status,
    List<PostModel>? posts,
    String? errorMessage,
    bool cleanError = false,
  }) {
    return PostState(
      status: status ?? this.status,
      posts: posts ?? this.posts,
      errorMessage: cleanError ? null : (errorMessage ?? this.errorMessage),
    );
  }
}
