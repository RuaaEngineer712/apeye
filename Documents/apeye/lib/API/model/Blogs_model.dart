import 'dart:convert';

import 'Blogs.dart';

class Blogs_model{

  final List<dynamic> blogs_model;

  Blogs_model({required this.blogs_model});

  factory Blogs_model.fromJson(Map<String, dynamic> jsonData){
    return Blogs_model(
      blogs_model : jsonData['items'],
    );
  }
}