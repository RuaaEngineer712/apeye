import 'dart:ffi';

import 'package:apeye/Home.dart';
import 'package:apeye/Inform.dart';
import 'package:apeye/app_bar/HomeScreen.dart';
import 'package:apeye/services/auth.dart';
import 'Registration.dart';
import 'package:apeye/main.dart';
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
  
  _Select(this.email);

  
  // int onCLick;
  

  
  CollectionReference Interests = FirebaseFirestore.instance.collection("Users");
  DatabaseUserManager data = new DatabaseUserManager();
 
  final Stream<QuerySnapshot> users = FirebaseFirestore.instance.collection('Users').snapshots();
  
  
  
  @override
  Widget build(BuildContext context) {
    var arr;
    var onClick;
    void getInterest(int click){
      setState(() {
        onClick = click;
      });
    }
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
                  child: 
                    Center(
                    child:Text(                    
                        "Choose your interest",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.yellow,
                        ),
                      ),
                    ),
                  ), 
              ),
              SizedBox(height: 30,),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox( 
                          width: 100,
                          height: 100,                                      
                          child: Card( 
                            child: InkWell(  
                              onTap: () async => {    
                                getInterest(1),                               
                                 if(onClick == 1){
                                   setState(() {
                                    arr = 'Engineer';
                                   }),
                                  // await data.userData("${email}", arr[0])
                                 }
                                            
                              },
                              child: Center( 
                                child: Text(                   
                                  "Engineer",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),     
                            color: Colors.yellow,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(200.0)),                       
                          ),
                        ),
                        SizedBox(                 
                          width: 150,
                          height: 150,                  
                          child: Card( 
                            child: InkWell(
                              onTap: () async => {
                                getInterest(2), 
                                if(onClick == 2){
                                   setState(() {
                                    arr[1] = 'Computer science';
                                   }),
                                  // await data.userData("${email}", arr[0])
                                 }
                                
                              },
                              child: Center(  
                                child: Text(                   
                                  "ComputerScience",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),     
                            color: Colors.grey[400],
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(200.0)),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 50,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(                 
                            width: 150,
                            height: 150,                  
                            child: Card( 
                              child: InkWell(
                                onTap: () async => {
                                   getInterest(3), 
                                   if(onClick == 3){
                                   setState(() {
                                    arr[2] = 'Management';
                                   }),
                                  // await data.userData("${email}", arr[0])
                                 }
                                  
                                },
                                child: Center(  
                                  child: Text(                   
                                    "Management",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),    
                              color: Colors.grey[400],
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(200.0)),
                            ),
                        ),

                        SizedBox(                 
                          width: 100,
                          height: 100,                  
                          child: Card(
                            child: InkWell(
                              onTap: () async => {
                                getInterest(4), 
                                if(onClick == 4){
                                   setState(() {
                                    arr[3] = 'Marketing';
                                   }),
                                  // await data.userData("${email}", arr[0])
                                 }
                              },
                              child: Center(                                
                                child: Text(                                            
                                "Marketing",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),      
                            color: Colors.yellow,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(200.0)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ), 
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  SizedBox(width: 230,),
                  RaisedButton(
                    color: Colors.black,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      "Next",
                      style: TextStyle(
                        color: Colors.yellow,
                        fontSize: 18,
                      ),
                    ),
                    onPressed: () async{

                      if(onClick == 0){
                        print("****************" + onClick.toString());
                      }
                      else{
                        await data.userData(email, arr);
                        Navigator.push(
                          context,
                          new MaterialPageRoute(
                            builder: (context) => new HomeScreen(email),
                          ),
                        );
                      }                   
                    }
                  )
                ],
              ),
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
