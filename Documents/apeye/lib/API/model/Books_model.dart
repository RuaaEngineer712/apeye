import 'dart:convert';

import 'Books.dart';

class Books_model{

  final List<dynamic> books_model;

  Books_model({required this.books_model});

  factory Books_model.fromJson(Map<String, dynamic> jsonData){
    return Books_model(
      books_model : jsonData['items'],
    );
  }
}