import 'package:meal_app/data/network/network_api_services.dart';
import 'package:meal_app/model/meal_model.dart';
import 'package:meal_app/res/app_urls/app_url.dart';

class HomeRepositry {
  final _apiServies = NetworkApiServices();
  Future<MealModel> mealList() async {
    final response = await _apiServies.getApi(AppUrl.baseUrl);
    return MealModel.fromJson(response);
  }
}
