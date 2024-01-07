import 'package:bloc/bloc.dart';
import 'package:clean_arch/sample_post.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostInitial()) {
    on<PostRequestsEvent>((event, emit) async {
      emit(PostStateLoading());

      await Future.delayed(Duration(seconds: 2), () {
        emit(PostStateLoaded(posts: posts));
      });
    });
  }
}
