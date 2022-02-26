import 'package:flutter/material.dart';
import 'Registration.dart';
import 'Login_final.dart';


class Final_Login extends StatelessWidget {    
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset('assets/images/welcome.jpg', height: 300,),
              SizedBox(height: 20,),
              Column(
                children: [
                  new Text(
                  "Hello \n",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black, 
                    ),
                  ),
                  new Text(
                    " It's all about your interest...\n Events, News, Courses, Jobs \n in the feild that you want to\n learn about \n hope you like it\ thank you ",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black, 
                    ),
                  ),
                ],
              ),
              SizedBox(height: 100,),
              SizedBox(
                height: 40,
                width: 200,
                child: RaisedButton (
                  onPressed: () {
                    // Navigator.pushNamed(context, "Registration");
                    Navigator.push(
                      context,
                      new MaterialPageRoute(
                        builder: (context) => new Registration(),
                      ),
                    );
                  },
                  color: Colors.yellow.withOpacity(0.8),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                  child: Text(
                    "Get Started",
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ), 
      )
    );
  }
}

