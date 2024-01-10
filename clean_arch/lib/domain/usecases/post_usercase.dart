import 'package:clean_arch/data/repositories/post_repo_impl.dart';
import 'package:clean_arch/domain/entities/post_entity.dart';
import 'package:clean_arch/domain/repositories/post_repositories.dart';
import 'package:clean_arch/sample_post.dart';

class PostUseCases{

  PostRepo postRepo = PostRepoImpl();

  Future<List<PostEntity>> getPostFromDataSource() async{

    final posts = await postRepo.getPostFromDataSource();
    return posts;

  }
}