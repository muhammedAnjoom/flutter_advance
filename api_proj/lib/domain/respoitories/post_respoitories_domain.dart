import 'package:api_proj/domain/entites/number_quote_enittes.dart';

abstract class PostRepo{
  Future<NumFactResp> getPostFromDataSources({required int number});
}