import 'package:clean_arch/data/datasources/post_remote_datasources.dart';
import 'package:clean_arch/domain/entities/post_entity.dart';
import 'package:clean_arch/domain/repositories/post_repositories.dart';

class PostRepoImpl implements PostRepo{

  PostRemoteDataSource postRemoteDataSource = PostRemoteDataSourceImpl();

  @override
  Future<List<PostEntity>> getPostFromDataSource() async{

    final posts = await postRemoteDataSource.getPostFromApi();
    return posts;
    
  }

}