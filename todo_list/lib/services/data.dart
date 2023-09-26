import 'package:dio/dio.dart';
import 'package:todo_list/model/add_todo_model.dart';

abstract class TodoData{
  Future<void> addTodoData(AddTodoModel value);
}

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

}