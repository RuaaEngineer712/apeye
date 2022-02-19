
import 'package:first_project/Inform.dart';
import 'package:first_project/ui/Some.dart';
import 'package:flutter/material.dart';
import './bottons.dart';

void main(){
  runApp(
    new MaterialApp(
      home: Go(),
    )
  );
}
 
class Go extends StatelessWidget {   
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Home",
      routes: <String, WidgetBuilder>{
        "/InformOne" : (BuildContext context) => new checkbox(),
        "/InformTwo" : (BuildContext context) => new Inform(),
        "/Login" : (BuildContext context) => new Some(),
      },
      home: Some(),
    );
  }
}
