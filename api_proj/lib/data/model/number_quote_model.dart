import 'package:api_proj/domain/entites/number_quote_enittes.dart';

class NumberQuoteModel extends NumFactResp {
  NumberQuoteModel({
    required text,
    required number,
    required found,
    required type,
  }) : super(
          text: text,
          number: number,
          found: found,
          type: type,
        );

  factory NumberQuoteModel.fromJson(Map<String, dynamic> json) {
    return NumberQuoteModel(
      text: json['text'],
      number: json['number'],
      found: json['found'],
      type: json['type'],
    );
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
