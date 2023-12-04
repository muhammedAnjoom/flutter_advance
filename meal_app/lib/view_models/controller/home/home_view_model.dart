import 'package:get/get.dart';
import 'package:meal_app/repository/home_respository/home_repository.dart';

import '../../../model/meal_model.dart';

class HomeController extends GetxController {
  final _api = HomeRepositry();
  List<Categories> categoriesData = <Categories>[].obs;
  List<Categories> bottomList = <Categories>[].obs;
  RxString errorRx = ''.obs;
  RxBool loading = false.obs;
  void getDataList() {
    loading.value=true;
    _api.mealList().then((value) {
      final categoriesItem = value.categories;
      if (categoriesItem == null) {
        categoriesData.addAll([]);
        bottomList.addAll([]);
      } else {
        categoriesData.addAll(categoriesItem);
        bottomList.addAll(categoriesItem);
        bottomList.shuffle();
        loading.value = false;
      }
    }).onError((error, stackTrace) {
      errorRx.value = error.toString();
    });
  }
}
