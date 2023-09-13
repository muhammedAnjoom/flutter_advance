import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:meal_app/model/meal_model.dart';
import 'package:http/http.dart' as http;

abstract class MealFunction{
  Future<List<Categories>> getMealData();
}

class MealDB implements MealFunction{
  @override
  Future<List<Categories>> getMealData() async{
     

     final result = await http.get(Uri.parse("https://www.themealdb.com/api/json/v1/1/categories.php"));
     final dataInJson  = jsonDecode(result.body) as Map<String,dynamic>;
     final dataINmodel = MealModel.fromJson(dataInJson);
     final categoriesItem = dataINmodel.categories;
     if(categoriesItem==null){
       return [];
     }else{
      return categoriesItem;
     }
  }

}