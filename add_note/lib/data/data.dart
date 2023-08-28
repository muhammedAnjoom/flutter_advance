import 'dart:convert';
import 'dart:math';

import 'package:add_note/data/url.dart';
import 'package:add_note/model/add_data_model.dart';
import 'package:add_note/model/get_all_dataModel.dart';
import 'package:dio/dio.dart';

abstract class ApiCalls {
  Future<AddModel?> createNote(AddModel value);
  Future<List<AddModel>> getAllNotes();
  Future<AddModel?> updateNote(AddModel value);
  Future<void> deleteNote(String id);
}

class NoteDb extends ApiCalls {
  final dio = Dio();
  final url = Url();

  NoteDb() {
    dio.options = BaseOptions(
      baseUrl: url.baseUrl,
      responseType: ResponseType.plain,
    );
  }
  @override
  Future<AddModel?> createNote(AddModel value) async {
    try {
      final result = await dio.post(
        url.createNote,
        data: value.toJson(),
      );
      print(result.data);
      final _resultAsJson = jsonDecode(result.data);
      return AddModel.fromJson(_resultAsJson as Map<String, dynamic>);
      // return AddModel.fromJson(jsonDecode(result.));
    } on DioException catch (e) {
      print(e.response?.data);
      print(e.toString());
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Future<void> deleteNote(String id) {
    // TODO: implement deleteNote
    throw UnimplementedError();
  }

  @override
  Future<List<AddModel>> getAllNotes() async {
    final _result = await dio.get(url.baseUrl + url.getNote);

    if (_result.data == null) {
      return [];
    } else {
      final _resultAsJson = jsonDecode(_result.data);
      final getnoteResp = GetAllNote.fromJson(_resultAsJson);
      // print(_resultAsJson);
      // print(getnoteResp.data);
      return getnoteResp.data!;
    }
  }

  @override
  Future<AddModel?> updateNote(AddModel value) {
    // TODO: implement updateNote
    throw UnimplementedError();
  }
}
