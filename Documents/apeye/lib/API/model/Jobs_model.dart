import 'dart:convert';

import 'Jobs.dart';

class Jobs_model{

  final List<dynamic> jobs_model;

  Jobs_model({required this.jobs_model});

  factory Jobs_model.fromJson(Map<String, dynamic> jsonData){
    return Jobs_model(
      jobs_model : jsonData['items'],
    );
  }
}