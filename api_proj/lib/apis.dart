import 'dart:convert';

import 'package:api_proj/number_fact_resp.dart';
import 'package:http/http.dart' as http;


Future<NumFactResp> getNumberData({required int number})async{
  final response=await http.get(Uri.parse("http://numbersapi.com/$number?json"));
  final _bodyAsJson= jsonDecode(response.body) as Map<String,dynamic>;
  final _data= NumFactResp.fromJson(_bodyAsJson);
  return _data;
}