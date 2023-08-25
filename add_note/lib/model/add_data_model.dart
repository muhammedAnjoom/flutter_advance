class AddModel {
  String? sId;
  String? title;
  String? content;

  AddModel({this.sId, this.title, this.content});
  AddModel.create({
    required this.sId,
    required this.title,
    required this.content,
  });

  AddModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['content'] = this.content;
    return data;
  }
}