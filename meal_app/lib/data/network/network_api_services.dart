import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:meal_app/data/app_exeception.dart';
import 'package:meal_app/data/network/base_api_services.dart';

class NetworkApiServices extends BaseApiServices {
  @override
  Future<dynamic> getApi(String url) async {
    try{
    final result = await http.get(
        Uri.parse("https://www.themealdb.com/api/json/v1/1/categories.php"));
    final dataInJson = jsonDecode(result.body) as Map<String, dynamic>;
    return dataInJson;
    }on SocketException{
      throw InternetExpcetion(message: '');
    }on RequestTimeOut{
      RequestTimeOut(message: '');
    }
  }
}
