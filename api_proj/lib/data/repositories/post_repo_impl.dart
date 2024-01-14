import 'package:api_proj/data/datasources/post_remote_data.dart';
import 'package:api_proj/domain/entites/number_quote_enittes.dart';
import 'package:api_proj/domain/respoitories/post_respoitories_domain.dart';

class PostRepoImp extends PostRepo {
  PostRemoteDataSources postRemoteDataSources = PostRemoteDataSourcesImp();
  @override
  Future<NumFactResp> getPostFromDataSources({required int number}) async {
    final numberQuote =
        await postRemoteDataSources.getPostFromApi(number: number);
    return numberQuote;
  }
}
