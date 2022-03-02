import 'package:flutter/cupertino.dart';

final String tableSaved = 'saved_content';

class Saved_field{
  static final List<String> values = [
    name, image, title, date, description
  ];


  static final String name = 'name';
  static final String image = 'image';
  static final String title = 'title';
  static final String date = 'date';
  static final String description = 'description';


}



class Saved_content_model{
  final String name;
  final String image;
  final String title;
  final String date;
  final String description;

  const Saved_content_model({
    required this.name,
    required this.image,
    required this.title,
    required this.date,
    required this.description,
  });

  Saved_content_model copy({
    String? name,
    final String? image,
    final String? title,
    final String? date,
    final String? description,
  }) =>
    Saved_content_model(name: this.name,image: this.image, title: this.title, date: this.date, description: this.description);
  
  static Saved_content_model fromJson(Map<String, Object?> json) => Saved_content_model(
    name: json[Saved_field.name] as String,
    image: json[Saved_field.image] as String,
    title: json[Saved_field.title] as String,
     date: json[Saved_field.date] as String,
    description: json[Saved_field.description] as String,
    );

  Map<String, Object?> toJson() => {
    Saved_field.name: name,
    Saved_field.image: image,
    Saved_field.title: title,
    Saved_field.date: date,
    Saved_field.description: description,
  
  }; 
}