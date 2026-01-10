part of 'post_bloc.dart';

abstract class PostEvent extends Equatable {
  const PostEvent();

  @override
  List<Object> get props => [];
}

class FetchPosts extends PostEvent {
  final int page;

  const FetchPosts({this.page = 1});

  @override
  List<Object> get props => [page];
}
