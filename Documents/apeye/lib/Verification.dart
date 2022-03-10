import 'dart:async';

import 'package:apeye/Registration.dart';
import 'package:apeye/Select_interest.dart';
import 'package:apeye/Welcome.dart';
import 'package:apeye/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Verification extends StatelessWidget { 
  String email;
  Verification(this.email); 
  @override
  Widget build(BuildContext context) {
    bool confirm;
    return Scaffold(
      body: 
      Center(
        child: new Column(
          children: [
            Text("Make sure that you verify your email by clicking the link that sent in your email and click the button bellow to continue"),            
            new RaisedButton(
              child: Text("Continue"),
              onPressed: () async{
                confirm = await isVerified();
                if(confirm){ 
                  await FirebaseAuth.instance.currentUser!.reload();
                  Timer(
                    Duration(seconds: 3),
                    () => Navigator.push(
                      context,
                      new MaterialPageRoute(
                        builder: (context) =>  Select_interest(email),
                      ),
                    ),
                  );
                }
                else {
                  Timer(Duration(seconds: 4),
                    () => Navigator.push(
                      context,
                      new MaterialPageRoute(
                        builder: (context) =>  Final_Login(),
                      ),
                    ),
                  );
                }
              }
            ),
          ],
        ),
      ),
    );
  }
}
