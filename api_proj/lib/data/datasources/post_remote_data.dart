import 'dart:convert';

import 'package:api_proj/data/model/number_quote_model.dart';
import 'package:api_proj/domain/entites/number_quote_enittes.dart';
import 'package:http/http.dart' as http;

abstract class PostRemoteDataSources {
  Future<NumFactResp> getPostFromApi({required int number});
}

class PostRemoteDataSourcesImp extends PostRemoteDataSources {
  @override
  Future<NumFactResp> getPostFromApi({required int number}) async {
    try {
      final response =
          await http.get(Uri.parse("http://numbersapi.com/$number?json"));
      if (response.statusCode == 200) {
        final bodyAsJson = jsonDecode(response.body);
        final numberQuote = NumberQuoteModel.fromJson(bodyAsJson);
        return numberQuote;
      } else {
        throw Exception("faild data not loaded");
      }
    } catch (e) {
      throw Exception('$e');
    }
  }
}
