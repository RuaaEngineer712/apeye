import 'dart:ffi';

import '/app_bar/HomeScreen.dart';
import '/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Select_interest extends StatefulWidget {    
  String email;
  Select_interest(this.email);
  @override
  State<StatefulWidget> createState() {
    return _Select(email);
  }
}
class _Select extends State<Select_interest> {
  
  String email;

   Map<String , String> arr = new Map<String , String>();
   int index = 0;

  _Select(this.email);
  
  CollectionReference Interests = FirebaseFirestore.instance.collection("Users");
  DatabaseUserManager data = new DatabaseUserManager();
 
  final Stream<QuerySnapshot> users = FirebaseFirestore.instance.collection('Users').snapshots();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView (
        child: Column(
          children: [
            ClipPath(
              clipper: myClipper(),
              child: Container(             
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
                child: Center(
                  child:Text(                    
                    "Choose your interest",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.lightBlue,
                    ),
                  ),
                ),
              ), 
            ),
            SizedBox(height: 30,),
            Container(
              child: Column(
                children: [
                  SizedBox(height: 100,),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [                        
                      SizedBox(
                        width: 100,
                        height: 50, 
                        child: InkWell(   
                          onTap: () async => {    
                            setState(() {
                              arr[index.toString()] = 'Engineer';
                              index++;
                            }),
                            print(arr),
                          },                        
                          child: Card(
                            child: Center(
                              child: Text(
                                "Engineer",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            color: Colors.blue[200],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 100,
                        height: 50,
                        child: InkWell(   
                          onTap: () async => {  
                            setState(() {
                              arr[index.toString()] = 'Marketing';
                              index++;
                            }),
                            print(arr),
                          },       
                          child: Card(
                            child: Center(
                              child: Text(
                                "Marketing",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            color: Colors.blue[400],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 40,),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 100,
                        height: 50,
                        child: InkWell(   
                          onTap: () async => {   
                            setState(() {
                              arr[index.toString()] = 'Computer';
                              index++;
                            }),
                            print(arr),
                          }, 
                          child: Card(
                            child: Center(
                              child: Text(
                                "Computer",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            color: Colors.blue[500],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 110,
                        height: 50,
                        child: InkWell(   
                          onTap: () async => {
                            setState(() {
                              arr[index.toString()] = 'Management';
                              index++;
                            }),
                            print(arr),
                          },
                          child: Card(
                            child: Center(
                              child: Text(
                                "Management",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            color: Colors.blue[700],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),                                                
                ],
              ),
            ),
              
            SizedBox(height: 100,),
              SizedBox(width: 150,),
              RaisedButton(
                color: Colors.black,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                child: Text(
                  "Next",
                  style: TextStyle(
                    color: Colors.lightBlue,
                    fontSize: 18,
                  ),
                ),
                onPressed: () async{
                  print("****************");
                  print(arr);
                  // if the element of arr is exist delete it , if not add it
                  await data.userData(email, arr);
                  Navigator.push(
                    context,
                    new MaterialPageRoute(
                      builder: (context) => new HomeScreen(email),
                    ),
                  );
                }  
              )
            ],
          ),
        )     
      );
    }
  }
class myClipper extends CustomClipper<Path> {
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0, size.height-70);
    var controllPoint = Offset(70, size.height);
    var endPoint = Offset(size.width/2, size.height);
    path.quadraticBezierTo(controllPoint.dx, controllPoint.dy, endPoint.dx, endPoint.dy);

    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    return path; 
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}