import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/model/add_todo_model.dart';
import 'package:todo_list/model/get_todo_model.dart';
import 'package:todo_list/model/todo_data_model.dart';

abstract class TodoData {
  Future<void> addTodoData(AddTodoModel value);
  Future<void> getTodoData();
  Future<void> deleteTodoData(String id);
  Future<void> completeTaskTodoData(AddTodoModel value, String id);
}

ValueNotifier<List<TodoDataModel>> todoItemNotifier = ValueNotifier([]);

class TodoDataFunction extends TodoData {
  final dio = Dio();
  final url = Uri();

  @override
  Future<void> addTodoData(AddTodoModel value) async {
    final result =
        await dio.post("https://api.nstack.in/v1/todos", data: value.toJson());
    await getTodoData();
  }

  @override
  Future<void> getTodoData() async {
    final result = await dio.get(
        "https://api.nstack.in/v1/todos?page=1&limit=10",
        options: Options(responseType: ResponseType.plain));
    final data = jsonDecode(result.data);
    todoItemNotifier.value.clear();
    final dataToJson = GetTodoModel.fromJson(data as Map<String, dynamic>);
    todoItemNotifier.value.addAll(dataToJson.items!);
    todoItemNotifier.notifyListeners();
    print(todoItemNotifier.value.length);
    // return todoItemNotifier.value;
  }

  @override
  Future<void> deleteTodoData(String id) async {
    final result = await dio.delete("https://api.nstack.in/v1/todos/$id");
    print("deleted sucessfull");
    await getTodoData();
  }

  @override
  Future<void> completeTaskTodoData(AddTodoModel value, String id) async {
    final result = await dio.put(
      "https://api.nstack.in/v1/todos/$id",
      data: value.toJson(),
    );
    await getTodoData();
  }
}
