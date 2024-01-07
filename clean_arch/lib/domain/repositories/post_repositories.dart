import 'package:clean_arch/domain/entities/post_entity.dart';

abstract class PostRepo{
  Future<List<PostEntity>> getPostFromDataSource();
}