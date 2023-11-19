import 'package:getx_project/data/network/network_api_services.dart';
import 'package:getx_project/models/home/user_list_model.dart';
import 'package:getx_project/res/app_url/app_url.dart';

class HomeRepositry{

  final _apiServices = NetworkApiServices();
  Future<UserListModel> userList()async{
    dynamic response = await _apiServices.getApi(AppUrl.userListApi);
    return UserListModel.fromJson(response);
  }

}