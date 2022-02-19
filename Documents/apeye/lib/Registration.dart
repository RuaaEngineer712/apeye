import 'dart:ui';
import 'package:apeye/Inform.dart';
import 'package:apeye/Login_final.dart';
import 'package:apeye/Select_interest.dart';
import 'package:apeye/services/auth.dart';
import 'package:apeye/ui/Some.dart';
import 'package:flutter/material.dart';


class Registration extends StatefulWidget {    @override
  State<StatefulWidget> createState() {
    return Register();
  }
}

class Register extends State<Registration>{
  // AuthBase authBase = AuthBase();
  final _formkey = GlobalKey<FormState>();
  String email = '', _password = '';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
          children: [
            SizedBox(height: 100,),
            Image.asset("assets/images/welcome.jpg", height: 300,),
            // Text("Login",
            //   style: TextStyle(
            //     color: Colors.green[800],
            //     fontSize: 30,
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),
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
                      onChanged: (value) => email = value,
                    validator: (value) => value!.isEmpty ? 'invalid email' : null,
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
                
                SizedBox(height: 100,),
                SizedBox(
                height: 40,
                width: 150,
                child: RaisedButton (
                  
                  // onPressed: () async{  
                  //   if(_formkey.currentState!.validate()){
                  //     await authBase.loginWithEmailAndPassword(_email, _password);
                  onPressed: () async{
                  if(_formkey.currentState!.validate()){  
                    bool shouldNavigate = await register(email, _password);
                    if (shouldNavigate) {
                      print("register ok");
                      
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                            builder: (context) => new Select_interest(),
                          ),
                        );
                      }
                      // else{
                      //   print("register failed");
                      //   Navigator.push(
                      //     context,
                      //     new MaterialPageRoute(
                      //       builder: (context) => new Login_final(),
                      //     ),
                      //   );
                      }
                  },
                    
                  // },
                  color: Colors.yellow.withOpacity(0.8),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                  child: Text(
                    "Register",
                    style: TextStyle(
                      color: Colors.grey[850],
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    new MaterialPageRoute(
                      builder: (context) => new Login_final(),
                    ),
                  );
                },
                child: Text("You have account!",style: TextStyle(color: Colors.black54),))
            ],
          ),
        )
      ),
    ],
  ),
      ),
    ),
  );
  }
}