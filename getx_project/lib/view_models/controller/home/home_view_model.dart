import 'package:get/get.dart';
import 'package:getx_project/data/response/status.dart';
import 'package:getx_project/models/home/user_list_model.dart';
import 'package:getx_project/repository/home_respositry/home_respositry.dart';

class HomeController extends GetxController {
  final _api = HomeRepositry();

  final rxRequestStatus = Status.LOADING.obs;
  final userList = UserListModel().obs;
  RxString error = ''.obs;
  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;
  void setUserList(UserListModel _value) => userList.value = _value;
  void setError(String _value) => error.value = _value;
  void userListApi() {
    _api.userList().then((value) {
      setRxRequestStatus(Status.COMPLETED);
      setUserList(value);
    }).onError((error, stackTrace) {
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
    });
  }
  void refresheApi() {
    setRxRequestStatus(Status.LOADING);
    _api.userList().then((value) {
      setRxRequestStatus(Status.COMPLETED);
      setUserList(value);
    }).onError((error, stackTrace) {
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
    });
  }
}

