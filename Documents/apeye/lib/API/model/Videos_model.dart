import 'dart:convert';

import 'Videos.dart';

class Videos_model{

  final List<dynamic> videos_model;

  Videos_model({required this.videos_model});

  factory Videos_model.fromJson(Map<String, dynamic> jsonData){
    return Videos_model(
      videos_model : jsonData['items'],
    );
  }
}