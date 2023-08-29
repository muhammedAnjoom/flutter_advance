import 'dart:convert';
import 'dart:math';

import 'package:add_note/data/url.dart';
import 'package:add_note/model/add_data_model.dart';
import 'package:add_note/model/get_all_dataModel.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

abstract class ApiCalls {
  Future<AddModel?> createNote(AddModel value);
  Future<List<AddModel>> getAllNotes();
  Future<AddModel?> updateNote(AddModel value);
  Future<void> deleteNote(String id);
}

class NoteDb extends ApiCalls {
  final dio = Dio();
  final url = Url();

  // sinagletone

  ValueNotifier<List<AddModel>> noteListNotfier = ValueNotifier([]);

  NoteDb() {
    dio.options = BaseOptions(
      baseUrl: url.baseUrl,
      responseType: ResponseType.plain,
    );
  }
  NoteDb._internal();
  static final instance = NoteDb._internal();
  NoteDb factory() {
    return instance;
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
      final note =  AddModel.fromJson(_resultAsJson as Map<String, dynamic>);
      noteListNotfier.value.insert(0, note);
      noteListNotfier.notifyListeners();
      return note;
      // return AddModel.fromJson(jsonDecode(result.));
    } on DioException catch (e) {
      print(e.response?.data);
      print(e.toString());
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Future<void> deleteNote(String id) async{
    final result = await dio.delete("${url.baseUrl+url.deletNote+id}");
     if (result.data == null) {
      return null;
    }
    // find index
    final index =
        noteListNotfier.value.indexWhere((note) => note.sId == id);
    if (index == -1) {
      return null;
    }
    noteListNotfier.value.removeAt(index);
    noteListNotfier.notifyListeners();
  }

  @override
  Future<List<AddModel>> getAllNotes() async {
    final _result = await dio.get(url.baseUrl + url.getNote,
        options: Options(responseType: ResponseType.plain));

    if (_result.data == null) {
      noteListNotfier.value.clear();
      return [];
    } else {
      try {
        final _resultAsJson = jsonDecode(_result.data);
        final getnoteResp = GetAllNote.fromJson(_resultAsJson);
        // print(_resultAsJson);
        // print(getnoteResp.data);
        noteListNotfier.value.clear();
        noteListNotfier.value.addAll(getnoteResp.data!.reversed);
        // print(noteListNotfier.value);
        noteListNotfier.notifyListeners();
        return getnoteResp.data!;
      } on Exception catch (_) {
        print("expeion");
        rethrow;
      }
    }
  }

  @override
  Future<AddModel?> updateNote(AddModel value) async {
    final result = await dio.put(url.baseUrl + url.updateNote,
        data: value.toJson(),
        options: Options(responseType: ResponseType.plain));
    if (result.data == null) {
      return null;
    }
    // find index
    final index =
        noteListNotfier.value.indexWhere((note) => note.sId == value.sId);
    if (index == -1) {
      return null;
    }
    noteListNotfier.value.removeAt(index);
    noteListNotfier.value.insert(index, value);
    noteListNotfier.notifyListeners();
  }

  AddModel? getNoteById(String id) {
    try {
      return noteListNotfier.value.firstWhere((note) => note.sId == id);
    } catch (_) {
      return null;
    }
  }
}
