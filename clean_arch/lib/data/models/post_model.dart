import 'package:clean_arch/domain/entities/post_entity.dart';
import 'package:flutter/material.dart';

class PostModel extends PostEntity {
  PostModel({required title, required body, required id, required userId})
      : super(
          body: body,
          title: title,
          userId: userId,
          id: id,
        );


  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      title: json['title'],
      body: json['body'],
      id: json['id'],
      userId: json['userId']
    );
   
  }
}
