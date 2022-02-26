import 'package:apeye/Home.dart';
import 'package:apeye/app_bar/HomeScreen.dart';
import 'package:apeye/app_bar/drawerScreen.dart';
import 'package:apeye/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_bar/HomeScreen.dart';

class Profile extends StatefulWidget {  
  String old;
  Profile(this.old);
  State<StatefulWidget> createState() {
    return _Profile(old);
  }
}

class _Profile extends State<Profile>{
  String old;
  _Profile(this.old);
  final _formkey = GlobalKey<FormState>();
  String _email = '', _password = '';
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //edit email & password
      body: Column(
        children: [
          
          Padding(padding: EdgeInsets.only(left:100, top: 100)),
          // SizedBox(height: 20,),
          new Text(
            "Update your profile",
            style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
            ),
          Form(
              key: _formkey,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                child: Column(
                children: [   
                  Container(
                    height: 40,
                    width: 300,
                    child: TextFormField( 
                      onChanged: (value) => _email = value,
                    // validator: (value) => value!.isEmpty ? 'invalid email' : null,
                    decoration: InputDecoration(
                      filled: true,                    
                      labelText: "Enter your email",
                      enabledBorder: OutlineInputBorder(
                        // borderSide: BorderSide(color: Colors.grey),                       
                        borderRadius: BorderRadius.circular(5),                       
                      ),
                    ),                    
                  ),
                  
                  ), 
                 
                  SizedBox(height: 40),
                  Container(
                    height: 40,
                    width: 300,
                    child: TextFormField(
                      onChanged: (value) => _password = value,
                    validator: (value) => value!.length < 6 ? 'your password must be more than 6' : null,
                    decoration: InputDecoration(
                      filled: true,
                      labelText: "Enter your password", 
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    obscureText: true,                                       
                  ),
                  ),

                  SizedBox(height: 80,),
                  
                 Container(
                child: Column(
                  children: [
                    new Text(
                      "Interests",
                      style: TextStyle(
                        // fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 40,),
                    SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: 
                      new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [                        
                        SizedBox(
                          width: 100,
                          height: 50,                          
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
                    
                        SizedBox(
                          width: 100,
                          height: 50,
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
                      // ],
                      //   ),
                        
                    //   ],
                    // ),
                    // SizedBox(height: 40,),
                    // new Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //   children: [
                        SizedBox(
                          width: 100,
                          height: 50,
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

                        SizedBox(
                          width: 110,
                          height: 50,
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
                      ],
                    ),    
                                    
                  // ],
                ),
                ],
              ),
                  ),
              
                  
                SizedBox(height: 100,),
                SizedBox(
                height: 40,
                width: 150,
                child: RaisedButton (
                  onPressed: () async{  
                  if(_formkey.currentState!.validate()){
                   bool shouldNavigate = await updateProfile(old,_email, _password);
                   if (shouldNavigate) {
                     Navigator.push(
                        context,
                        new MaterialPageRoute(
                          builder: (context) => new HomeScreen(_email),
                        ),
                      );
                    }
                    }
                  },
                  color: Colors.lightBlue[900],
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                  child: Text(
                    "Update",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              
            ],
          ),
        )
      ),
























          // Container(
          //   height: 40,
          //   width: 300,
          //   child: TextFormField( 
          //     onChanged: (value) => _email = value,
          //     // validator: (value) => value!.isEmpty ? 'invalid email' : null,
          //     decoration: InputDecoration(
          //       filled: true,                    
          //       labelText: "Enter your email",
          //       enabledBorder: OutlineInputBorder(
          //         // borderSide: BorderSide(color: Colors.grey),                       
          //         borderRadius: BorderRadius.circular(5),                       
          //       ),
          //     ),                    
          //   ),
          // ),
          // SizedBox(height: 40),
          // Container(
          //   height: 40,
          //   width: 300,
          //   child: TextFormField(
          //     onChanged: (value) => _password = value,
          //     validator: (value) => value!.length < 6 ? 'your password must be more than 6' : null,
          //     decoration: InputDecoration(
          //       filled: true,
          //       labelText: "Enter your new password", 
          //       enabledBorder: OutlineInputBorder(
          //         borderSide: BorderSide(color: Colors.grey),
          //         borderRadius: BorderRadius.circular(5),
          //       ),
          //     ),
          //     obscureText: true,                                       
          //   ),
          // ),

          // SizedBox(height: 100,),
          //       SizedBox(
          //       height: 40,
          //       width: 150,
          //       child: RaisedButton (
          //         onPressed: () async{  
          //           // print("**************");
          //           if(_formkey.currentState!.validate()){
          //             print("**************"+ old);
          //             bool shouldNavigate = await updateProfile(old, _email, _password);
          //             if(shouldNavigate){
          //               Navigator.push(
          //                 context,
          //                 new MaterialPageRoute(
          //                   builder: (context) => new DrawerScreen(_email),
          //                 ),
          //               );
          //             }
          //           //   else{
          //           //     print("Errorrrrrrrrrr");
          //           //   }
          //           }                  
          //         },
                  
          //         color: Colors.yellow.withOpacity(0.8),
          //         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          //         child: Text(
          //           "Update",
          //           style: TextStyle(
          //             color: Colors.grey[850],
          //             fontSize: 18,
          //           ),
          //         ),
          //       ),
          //     ),

        ],
      ),
         
      //edit interests
      
    );
  }
}