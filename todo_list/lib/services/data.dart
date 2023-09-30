import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/model/add_todo_model.dart';
import 'package:todo_list/model/get_todo_model.dart';
import 'package:todo_list/model/todo_data_model.dart';
import 'package:todo_list/services/url.dart';

abstract class TodoData {
  Future<void> addTodoData(AddTodoModel value);
  Future<void> getTodoData();
  Future<void> deleteTodoData(String id);
  Future<void> completeTaskTodoData(AddTodoModel value, String id);
  Future<void> updateTodoData(AddTodoModel value, String id);
}

ValueNotifier<List<TodoDataModel>> todoItemNotifier = ValueNotifier([]);

class TodoDataFunction extends TodoData {
  final dio = Dio();
  final url = UrlTodo();

  @override
  Future<void> addTodoData(AddTodoModel value) async {
    // add todo
    final result = await dio.post(url.postUrl, data: value.toJson());
    await getTodoData();
  }

  @override
  Future<void> getTodoData() async {
    // get todo
    try {
      final result = await dio.get(url.getUrl,
          options: Options(responseType: ResponseType.plain));

      if (result.statusCode == 200) {
        final data = jsonDecode(result.data);
        todoItemNotifier.value.clear();
        final dataToJson = GetTodoModel.fromJson(data as Map<String, dynamic>);
        todoItemNotifier.value.addAll(dataToJson.items!);
        todoItemNotifier.value = todoItemNotifier.value.reversed.toList();
        todoItemNotifier.value.sort((a, b) {
          if (a.isCompleted!) {
            return 1;
          } else {
            return -1;
          }
        });
        todoItemNotifier.notifyListeners();
        print(todoItemNotifier.value.length);
      }
    } on DioException {
    } catch (e) {
      print(e.toString());
    }
    // return todoItemNotifier.value;
  }

  @override
  Future<void> deleteTodoData(String id) async {
    // deleted todo
    final result = await dio.delete("${url.deleteUrl}$id");
    print("deleted sucessfull");
    await getTodoData();
  }

  @override
  Future<void> completeTaskTodoData(AddTodoModel value, String id) async {
    // update complete task
    final result = await dio.put(
      "${url.updateUrl}$id",
      data: value.toJson(),
    );
    await getTodoData();
  }

  @override
  Future<void> updateTodoData(AddTodoModel value, String id) async {
    // update todo itam
    final result = await dio.put(
      "${url.deleteUrl}$id",
      data: value.toJson(),
    );
    await getTodoData();
  }
}
