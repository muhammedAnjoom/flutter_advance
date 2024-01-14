import 'package:api_proj/data/repositories/post_repo_impl.dart';
import 'package:api_proj/domain/entites/number_quote_enittes.dart';
import 'package:api_proj/domain/respoitories/post_respoitories_domain.dart';

class PostUseCases {
  PostRepo postRepo = PostRepoImp();
  Future<NumFactResp> getPostFromUseCase({required int number}) async {
    final numberQuote = await postRepo.getPostFromDataSources(number: number);
    return numberQuote;
  }
}
