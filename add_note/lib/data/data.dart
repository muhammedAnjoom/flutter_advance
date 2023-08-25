import 'package:add_note/data/url.dart';
import 'package:add_note/model/add_data_model.dart';
import 'package:dio/dio.dart';

abstract class ApiCalls {
  Future<AddModel?> createNote(AddModel value);
  Future<List<AddModel?>> getAllNotes();
  Future<AddModel?> updateNote(AddModel value);
  Future<void> deleteNote(String id);
}


class NoteDb extends ApiCalls{
  final dio =Dio();
  final url = Url();
  @override
  Future<AddModel?> createNote(AddModel value) async{
    final result = await dio.post<AddModel>(url.baseUrl+url.createNote);
    return result.data;
  }

  @override
  Future<void> deleteNote(String id) {
    // TODO: implement deleteNote
    throw UnimplementedError();
  }

  @override
  Future<List<AddModel?>> getAllNotes() {
     dio.get(url.baseUrl+url.getNote);
  }

  @override
  Future<AddModel?> updateNote(AddModel value) {
    // TODO: implement updateNote
    throw UnimplementedError();
  }

}