import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:get/get_connect/connect.dart';
import 'package:getx_project/data/app_execeptions.dart';
import 'package:getx_project/data/network/base_api_services.dart';
import 'package:http/http.dart' as http;

class NetworkApiServices extends BaseApiServices {
  @override
  Future getApi(String url) async {
    if (kDebugMode) {
      print(url);
    }
    dynamic responseJson;
    try {
      final response = await http.get(Uri.parse(url)).timeout(
            const Duration(
              seconds: 10,
            ),
          );
      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException('');
    } on RequestTimeOut {
      throw RequestTimeOut('');
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      default:
        throw FetchDataException('Error while communication with server' +
            response.statusCode.toString());
    }
  }

  @override
  Future postApi(String url, data) async {
    dynamic responseJson;
    if (kDebugMode) {
      print(url);
      print(data);
    }

    try {
      final response =
          await http.post(Uri.parse(url), body: jsonEncode(data)).timeout(
                const Duration(
                  seconds: 10,
                ),
              );
      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException('');
    } on RequestTimeOut {
      throw RequestTimeOut('');
    }
    return responseJson;
  }
}
