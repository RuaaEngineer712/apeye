import 'dart:ui';
import 'package:first_project/Inform.dart';
import 'package:first_project/Login_final.dart';
import 'package:first_project/services/auth.dart';
import 'package:first_project/ui/Some.dart';
import 'package:flutter/material.dart';


class Registration extends StatefulWidget {    @override
  State<StatefulWidget> createState() {
    return Register();
  }
}

class Register extends State<Registration>{
  // AuthBase authBase = AuthBase();
  final _formkey = GlobalKey<FormState>();
  String _email = '', _password = '';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
          children: [
            Image.asset("assets/images/search.png", height: 200,),
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
                    child: TextFormField( 
                      onChanged: (value) => _email = value,
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
                 
                  SizedBox(height: 20),
                  Container(
                    height: 40,
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
                  
                SizedBox(height: 20,),
                SizedBox(
                height: 40,
                width: 150,
                child: RaisedButton (
                  
                  // onPressed: () async{  
                  //   if(_formkey.currentState!.validate()){
                  //     await authBase.loginWithEmailAndPassword(_email, _password);
                  onPressed: () async{  
                   bool shouldNavigate = await register(_email, _password);
                   if (shouldNavigate) {
                     print("register ok");
                     Navigator.push(
                        context,
                        new MaterialPageRoute(
                          builder: (context) => new Some(),
                        ),
                      );
                    }
                    else{
                      print("register failed");
                      Navigator.push(
                        context,
                        new MaterialPageRoute(
                          builder: (context) => new Login_final(),
                        ),
                      );
                    }
                  },
                  color: Colors.green[900],
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                  child: Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.white,
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
                child: Text("dont have account!",style: TextStyle(color: Colors.black54),))
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