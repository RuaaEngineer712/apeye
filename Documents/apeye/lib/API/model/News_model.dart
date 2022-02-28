import 'dart:convert';

import 'News.dart';

class News_model{

  final List<dynamic> news_model;

  News_model({required this.news_model});

  factory News_model.fromJson(Map<String, dynamic> jsonData){
    return News_model(
      news_model : jsonData['articles'],
    );
  }
}