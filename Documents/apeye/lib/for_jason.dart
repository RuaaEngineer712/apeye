import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';

parseJSONFunction(){
  final jsonData = '{ "title" : "Title", "description": "here we have alot of details about the title...","image" : "assets/images/test.jpg","avatar" : "assets/images/welcome.jpg", "link": "https://Indeed.com"  }';

  final parseJson = jsonDecode(jsonData);

  print(parseJson['title']);
}

class Jobs {
  Jobs({required this.title, required this.description,required this.image,required this.avatar, required this.link });

  final String title;
  final String description;
  final Image image;
  final Image avatar;
  final Link link;

  factory Jobs.fromJson(Map<String, dynamic> data){

     final title = data['title'] as String;
    final description = data['description'] as String;
    final image = data['image'] as Image?;
    final avatar = data['avatar'] as Image;
    final link = data['link'] as Link;

    return Jobs(title: title, description: description, image: image ?? Image.asset("assets/images/welcom.jpg"), avatar: avatar,link: link );

  }
}