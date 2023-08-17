class NumFactResp {
  String? text;
  int? number;
  bool? found;
  String? type;

  NumFactResp({this.text, this.number, this.found, this.type});

  NumFactResp.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    number = json['number'];
    found = json['found'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    data['number'] = this.number;
    data['found'] = this.found;
    data['type'] = this.type;
    return data;
  }
}