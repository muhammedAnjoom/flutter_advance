import 'package:bloc/bloc.dart';
import 'package:clean_arch/domain/entities/post_entity.dart';
import 'package:clean_arch/domain/usecases/post_usercase.dart';
import 'package:clean_arch/sample_post.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostInitial()) {
    on<PostRequestsEvent>((event, emit) async {

      print("block initialized");
      try{
        emit(PostStateLoading());
        await Future.delayed(Duration(seconds: 2)).then((value) async{
     final posts = await PostUseCases().getPostFromDataSource();
        emit(PostStateLoaded(posts: posts));
        });
      }catch(e){
        emit(PostStateError(message: e.toString()));
      }
    });
  }
}
