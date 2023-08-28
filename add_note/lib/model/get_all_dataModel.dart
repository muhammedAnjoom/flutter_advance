import 'package:add_note/model/add_data_model.dart';

class GetAllNote {
  List<AddModel>? _data;

  GetAllNote({List<AddModel>? data}) {
    if (data != null) {
      this._data = data;
    }else{
      this._data = const [];
    }
  }

  List<AddModel>? get data => _data;
  set data(List<AddModel>? data) => _data = data;

  GetAllNote.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      _data = <AddModel>[];
      json['data'].forEach((v) {
        _data!.add(new AddModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._data != null) {
      data['data'] = this._data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}