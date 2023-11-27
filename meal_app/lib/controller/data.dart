import 'dart:convert';
import 'package:get/state_manager.dart';
import 'package:meal_app/model/meal_model.dart';
import 'package:http/http.dart' as http;

List data = [];

class MealDB extends GetxController {
  static final MealDB _instance = MealDB._internal();
  factory MealDB() {
    return _instance;
  }
  MealDB._internal();

  List<Categories> categoriesData = <Categories>[].obs;
    List<Categories> bottomList = <Categories>[].obs;

  Future<void> getMealData() async {
    final result = await http.get(
        Uri.parse("https://www.themealdb.com/api/json/v1/1/categories.php"));
    final dataInJson = jsonDecode(result.body) as Map<String, dynamic>;
    final dataINmodel = MealModel.fromJson(dataInJson);
    final categoriesItem = dataINmodel.categories;
    // print(categoriesItem);
    // print(categoriesData.length);
    if (categoriesItem == null) {
      print("no data");
    } else {
      categoriesData.addAll(categoriesItem);
      bottomList.addAll(categoriesItem);
      bottomList.shuffle();
      print(bottomList.length);
      // print(categoriesItem.length);
    }
  }
}
