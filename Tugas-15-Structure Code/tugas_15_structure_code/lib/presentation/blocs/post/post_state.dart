part of 'post_bloc.dart';

abstract class PostState extends Equatable {
  const PostState();

  @override
  List<Object> get props => [];
}

class PostInitial extends PostState {}

class PostLoading extends PostState {
  final int page;

  const PostLoading(this.page);

  @override
  List<Object> get props => [page];
}

class PostLoaded extends PostState {
  final List<Post> posts;
  final int currentPage;
  final int totalPages;

  const PostLoaded(this.posts, {this.currentPage = 1, this.totalPages = 10});

  @override
  List<Object> get props => [posts, currentPage, totalPages];
}

class PostError extends PostState {
  final String message;

  const PostError(this.message);

  @override
  List<Object> get props => [message];
}
