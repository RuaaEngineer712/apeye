import 'package:apeye/Home.dart';
import 'package:apeye/app_bar/HomeScreen.dart';
import 'package:apeye/app_bar/drawerScreen.dart';
import 'package:apeye/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_bar/HomeScreen.dart';

class Profile extends StatefulWidget {  
  String old;
  // List interest;
  Profile(this.old);
  State<StatefulWidget> createState() {
    return _Profile(old);
  }
}

class _Profile extends State<Profile>{

  String old;
  // List interest;
  _Profile(this.old);
  final _formkey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';
  Map<String , String> arr = new Map<String , String>();
   int index = 0;
     List interrests = [];

   

     DatabaseUserManager data = new DatabaseUserManager();

  @override
  void initState() {
    // TODO: implement initState
    
    super.initState();
    
  }

  void callIntersetData() async {
  
      List fromApi = await data.getInterest(_email);
      setState(() {
        print("Data :::::::::::::::::::::::::");
        print(fromApi);
        interrests = fromApi;
        index = 1;
      });
  }

  @override
  Widget build(BuildContext context) {
    
    _email = this.old;
    if (interrests.length == 0 && index == 0){
      callIntersetData();
    }
      //   Future<List> fromApi = data.getInterest(_email);
      // if (interrests.length == 0){
        
      //   setState(() {
      //     fromApi.then((value) => {
      //       interrests =  value,
      //       print(value),
      //     });
      //   });
      // }
    return Scaffold(      
      //edit email & password
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
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
                          initialValue: this.old,
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
                                            interrests..removeWhere((value) => value == 'Engineer');
                                            interrests.add('Engineer');
                                          }),
                                          
                                          // await data.userData("${email}", arr[0])
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
                                            interrests..removeWhere((value) => value == 'Marketing');
                                            interrests.add('Marketing');
                                          }),
                                        
                                          // await data.userData("${email}", arr[0])
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
                                            interrests..removeWhere((value) => value == 'Computer');
                                            interrests.add('Computer');
                                          }),
                                      
                                          
                                          // await data.userData("${email}", arr[0])
                                      }, 
                                  child: Card(
                                    
                                    // ),
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
                                            interrests..removeWhere((value) => value == 'Management');
                                            interrests.add('Management');
                                          }),
                                          // await data.userData("${email}", arr[0])
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
                             Column(
                              children: [   
                                Padding(padding: EdgeInsets.only(bottom: 50)),
                                for(var interrest in interrests)
                                
                                // Text(interrest.toString()),
                                Row(children: [
                                  Padding(padding: EdgeInsets.only(left: 80, top: 40)),
                                  Text(interrest.toString()),
                                  
                                  InkWell(
                                      child: Icon(Icons.close),
                                      onTap: ()  => {
                                        setState(() {
                                          interrests..removeWhere((element) => element == interrest);
                                          // arr..removeWhere((key, value) => value == interrest);
                                        })
                                      }
                                    ),
                                ],)
                                
                              ],
                            )                                                          
                          ],
                        ),
                      ),
              
              SizedBox(height: 100,),
                  SizedBox(width: 150,),
                  RaisedButton(
                    color: Colors.blue[900],
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      "Update",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    onPressed: () async{
                       
                        await data.updateProfile(old, _email, _password , interrests);

                        Navigator.push(
                          context,
                          new MaterialPageRoute(
                            builder: (context) => new HomeScreen(_email),
                          ),
                        );
                      }                   
                    
                  )
                  ],
                ),
              ),        
            ),
          ],
        )
      )
    );
  }
  // Future<List> getInterests(String email)async{
  //   DatabaseUserManager data = new DatabaseUserManager();
    
  //   return await data.getInterest(email);
  // }
}