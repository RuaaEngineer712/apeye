import 'dart:ffi';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

import 'Select_interest.dart';

class Menu extends StatelessWidget {    
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: new ListView(
        children: [
          ClipPath(
            clipper: myClipper(),
            child: Container(             
              height: 00,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: Container(
                child: Image.asset('assets/images/Engineer.PNG'),
              ),
            ), 
          ),
          Container(
            child: Column(
              children: [
                FlatButton(onPressed: null, child: new Text('Profile')),
                FlatButton(onPressed: null, child: new Text('about us')),
                FlatButton(onPressed: null, child: new Text('switch mode')),
                FlatButton(onPressed: null, child: new Text('Logout')),
                
              ],
            ),
          ),
        ],
      ),
    );
  }

}
