
import 'package:get/get.dart';
import 'package:getx_project/data/response/status.dart';
import 'package:getx_project/models/home/user_list_model.dart';
import 'package:getx_project/repository/home_respositry/home_respositry.dart';

class HomeController extends GetxController{
  final _api = HomeRepositry();

  final rxRequestStatus = Status.LOADING.obs;
    final userList = UserListModel().obs;

    void setRxRequestStatus(){
      
    }


  void userListApi(){
    _api.userList().then((value) {

    }).onError((error, stackTrace) {

    });
  }
}