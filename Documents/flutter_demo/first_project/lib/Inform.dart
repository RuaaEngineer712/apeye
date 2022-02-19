import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:flutter/rendering.dart';
import 'learn.dart';

class Inform extends StatefulWidget {    
  @override
  State<StatefulWidget> createState() {
    return new _InformHome();
  }
}

class _InformHome extends State<Inform>{
  var x = DateTime.now();
  String text2 = "";
  // Color c = const Color(0xFF42A5F5);
  // Color c = new Color(1976D2),

  void onChangePass(String pass){
    setState(() {
      text2 = "$pass";
    });
  }
  
  @override
  Widget build(BuildContext context) {  
              // SingleChildScrollView(
              //   child: new Column(
              //     children: [
              //       new Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     new Column(
              //       mainAxisAlignment: MainAxisAlignment.start,
              //       children: [
                      
                     
              //       ],
              //     ),
              return new Container(
                child: new Column(
                  children: [
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.menu, color: Colors.white),
                        new Row(
                          children: [
                            Icon(Icons.notifications, color: Colors.white),
                            Icon(Icons.person, color: Colors.white),
                          ],
                        ),
                      ],
                    ),
              SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
              child: new Container(
                   padding: EdgeInsets.only(top: 10),
                child: new Row( 
                  
                //categories
                children: [
                  
                  new Card(
                   color: Color.fromARGB(1000, 25, 118, 210),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(200.0)),
                    child: new FlatButton(
                      minWidth: 55,
                      height: 35,
                      onPressed: null,
                      child: new Text(
                        "All",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                        
                    ),
                  ),
                   new Card(
                     
                    color: Color.fromARGB(1000, 33, 150, 243),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(200.0)),
                    
                    child: new FlatButton(
                      minWidth: 55,
                      height: 35,
                      onPressed: null,
                      child: new Text(
                        "News",
                        style: TextStyle(
                          color: Colors.black,
                        ),),        
                    ),
                  ),
                  new Card(
                    color: Color.fromARGB(1000, 3, 169, 244),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(200.0)),
                    child: new FlatButton(
                      minWidth: 55,
                      height: 35,
                      onPressed: null,
                      child: new Text(
                        "Courses",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),    
                    ),
                  ),
                  new Card(
                    color: Color.fromARGB(1000, 95, 184, 255),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(200.0)),
                    child: new FlatButton(
                      minWidth: 55,
                      height: 35,
                      onPressed: null,
                      child: new Text(
                        "Jobs",
                        style: TextStyle(
                          color: Colors.black,
                        ),),
                        
                    ),
                  ),
                  new Card(
                     color: Color.fromARGB(1000, 158, 225, 255),
                    
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(200.0)),
                    child: new FlatButton(
                        minWidth: 50,
                      height: 35,
                        onPressed: null,
                        child: new Text(
                          "Events",
                        style: TextStyle(
                          color: Colors.black,
                        ),), 
                    ),
                  ),
                ],
                ),
              ),
            ),
          
           new Container(
            child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
             child: new Column(
                mainAxisAlignment: MainAxisAlignment.start,
                //all
                children: [
                  Padding(padding: EdgeInsets.only(top: 33.0)),
                  new Text(
                    "\nAll about your interest",
                    style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontFamily: "Roboto",
                      color: Colors.white,
                      fontSize: 19,
                    )),


                  new Column(
                    children: [
                      new Text("News",
                                style: TextStyle(
                                  color: Colors.white,
                                ),),
                       new Card(      
                    //news
                   
                    margin: EdgeInsets.only(left: 33.0,right: 33.0, bottom: 5.0, top: 25.0),
                    color: Color.fromARGB(1000, 187, 222, 251),
                    
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                            new Column(
                              children: [
                                new Row(
                                  children: [
                                    Icon(Icons.person),
                                    new Text(
                                      "Name",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],     
                                ),
                                
                                new Text(
                                  //time
                                  "$x\n\n",
                                  style: TextStyle(
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ), 
                            new Text("Here is \n the post \n\n from user"),
                      ],
                    ),
                  ),
                    ],
                  ),
                 


                  //while loop to add all courses cards in the same style...
                  new Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      
                      new Text("Course",
                        style: TextStyle(
                          color: Colors.white,

                        ),),
                  new Card(
                    margin: EdgeInsets.only(left: 33.0,right: 33.0, bottom: 5.0, top: 25.0),
                    //course
                    color: Color.fromARGB(1000, 187, 222, 251),
                    
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            new Text("Tall Title about...",
                            style: TextStyle(fontSize: 20),),
                            //three dot
                            new Icon(Icons.menu),
                          ],
                        ),
                        new Column(
                          children: [
                            //user image
                            new Row(
                              children: [
                                Icon(Icons.person),
                                new Text("User name",
                                style: TextStyle(fontSize: 10),),
                              ],
                            ),
                          
                            new Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                new Text("description about it",
                                style: TextStyle(fontSize: 10),),
                                new RaisedButton(
                                  
                                  color: Colors.deepOrangeAccent,
                                  onPressed: null,
                                  child: 
                                  new Text("see course"),
                                )
                              ],
                            ),
                            ],
                    ),    
                  ],
                ),
              ),
                    ],
                  ),
                  

              //Row and cards inside While loop 
              new Column(
                children: [
                   new Text("Job",
                                style: TextStyle(
                                  color: Colors.white,
                                ),),
                  new Card(
                    margin: EdgeInsets.only(left: 33.0,right: 33.0, bottom: 5.0, top: 25.0),
                    //course
                    color: Color.fromARGB(1000, 187, 222, 251),
                    
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            new Text("Tall Title about...",
                            style: TextStyle(fontSize: 20),),
                            //three dot
                            new Icon(Icons.menu),
                          ],
                        ),
                        new Column(
                          children: [
                            //user image
                            new Row(
                              children: [
                                Icon(Icons.person),
                                new Text("User name",
                                style: TextStyle(fontSize: 10),),
                              ],
                            ),
                          
                            new Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                new Text("description about it",
                                style: TextStyle(fontSize: 10),),
                                new RaisedButton(
                                  
                                  color: Colors.deepOrangeAccent,
                                  onPressed: null,
                                  child: 
                                  new Text("see course"),
                                )
                              ],
                            ),
                            ],
                    ),    
                  ],
                ),
              ),
                ],
              ),
                 
              new Column(
                children: [
                   new Text("Events",
                                style: TextStyle(
                                  color: Colors.white,
                                ),),
                  new Card(
                    margin: EdgeInsets.only(left: 33.0,right: 33.0, bottom: 5.0, top: 25.0),
                    //course
                    color: Color.fromARGB(1000, 187, 222, 251),
                    
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        new Text("Events"),
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            new Text("Tall Title about...",
                            style: TextStyle(fontSize: 20),),
                            //three dot
                            new Icon(Icons.menu),
                          ],
                        ),
                        new Column(
                          children: [
                            //user image
                            new Row(
                              children: [
                                Icon(Icons.person),
                                new Text("User name",
                                style: TextStyle(fontSize: 10),),
                              ],
                            ),
                          
                            new Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                new Text("description about it",
                                style: TextStyle(fontSize: 10),),
                                new RaisedButton(
                                  
                                  color: Colors.deepOrangeAccent,
                                  onPressed: null,
                                  child: 
                                  new Text("see course"),
                                )
                              ],
                            ),
                          ],
                        ),    
                      ],
                    ),
            ),
                ],
              ),
                 
          ],
          ), 
            ),

           ),
                  ],
                ), 
    );
    
  }
}