import 'package:clean_arch/domain/entities/post_entity.dart';
import 'package:clean_arch/sample_post.dart';

class PostUseCases{
  Future<List<PostEntity>> getPostFromDataSource() async{
    List<PostEntity> allposts= await posts.cast<PostEntity>();
    return allposts;
  }
}