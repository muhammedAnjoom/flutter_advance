import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/model/add_todo_model.dart';
import 'package:todo_list/model/get_todo_model.dart';

abstract class TodoData{
  Future<void> addTodoData(AddTodoModel value);
  Future<void> getTodoData();
}
 ValueNotifier<List<AddTodoModel>> todoItemNotifier = ValueNotifier([]);
class TodoDataFunction extends TodoData{

  final dio = Dio();
  final url = Uri();
 
  @override
  Future<void> addTodoData(AddTodoModel value) async{
    final result = await dio.post(
      "https://api.nstack.in/v1/todos",
      data: value.toJson()
    );
  }
  
  @override
  Future<void> getTodoData() async{
    final result = await dio.get("https://api.nstack.in/v1/todos?page=1&limit=10",options: Options(
      responseType: ResponseType.plain
    ));
    final data = jsonDecode(result.data);
    todoItemNotifier.value.clear();
    final dataToJson = GetTodoModel.fromJson(data as Map<String,dynamic>);
    todoItemNotifier.value.addAll(dataToJson.items!);
    todoItemNotifier.notifyListeners();
    print(todoItemNotifier.value.length);
    // return todoItemNotifier.value;
  }



}