import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tugas_15_structure_code/domain/entities/comment.dart';
import 'package:tugas_15_structure_code/domain/usecases/get_comments_by_post_id.dart';

part 'comment_event.dart';
part 'comment_state.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  final GetCommentsByPostId getCommentsByPostId;

  CommentBloc({required this.getCommentsByPostId}) : super(CommentInitial()) {
    on<FetchComments>((event, emit) async {
      emit(CommentLoading());
      try {
        final comments = await getCommentsByPostId(event.postId);
        emit(CommentLoaded(comments));
      } catch (e) {
        emit(CommentError(e.toString()));
      }
    });
  }
}
