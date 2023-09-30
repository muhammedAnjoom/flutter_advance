import 'package:todo_list/model/add_todo_model.dart';
import 'package:todo_list/model/todo_data_model.dart';
import 'package:todo_list/services/data.dart';

class GetTodoModel {
  int? code;
  bool? success;
  int? timestamp;
  String? message;
  List<TodoDataModel>? items;

  GetTodoModel(
      {this.code, this.success, this.timestamp, this.message, this.items});

  GetTodoModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    success = json['success'];
    timestamp = json['timestamp'];
    message = json['message'];
    if (json['items'] != null) {
      items = <TodoDataModel>[];
      json['items'].forEach((v) {
        items!.add(new TodoDataModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['success'] = this.success;
    data['timestamp'] = this.timestamp;
    data['message'] = this.message;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
