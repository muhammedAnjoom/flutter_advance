import 'package:getx_project/data/network/network_api_services.dart';
import 'package:getx_project/res/app_url/app_url.dart';

class LoginRepository{

  final _apiServices = NetworkApiServices();
  Future<dynamic> loginApi(var data)async{
    dynamic response = await _apiServices.postApi(AppUrl.loginApi, data);
    return response;
  }

}