import 'package:apeye/Saved_content.dart';

import '/Login_final.dart';
import 'package:flutter/material.dart';
import 'configuration.dart';
import '/Profile.dart';
import '/about_us.dart';
import '/services/auth.dart';

class DrawerScreen extends StatefulWidget {
  String email;
  DrawerScreen(this.email);

  @override
  _DrawerScreenState createState() => _DrawerScreenState(email);
}

class _DrawerScreenState extends State<DrawerScreen> {
  DatabaseUserManager data = new DatabaseUserManager();
  int onClick = 0;
  String email;
  _DrawerScreenState(this.email);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blueGrey[900],
        padding: EdgeInsets.only(top:50,bottom: 70,left: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(),
                SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('User Name',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                    Text(email,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold))
                  ],
                )
              ],
            ),
            Column(
              children:  
              drawerItems.map(    
                (element) => Padding(                
                  padding: const EdgeInsets.all(8.0),   
                  child: InkWell(
                    child: Row(
                      children: [    
                        Icon(element['icon'],color: Colors.white,size: 30,),
                        SizedBox(width: 10,),
                        Text(element['title'],style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20))
                      ],
                    ),
                    onTap: () => {
                      print(element),
                      // getElement('profile'), 
                      if(element['title'] == 'profile'){
                        Navigator.push(
                        context,
                        new MaterialPageRoute(
                          builder: (context) =>  Profile(email),
                        ),
                      ),
                    }
                    else if(element['title'] == 'Saved content'){
                        Navigator.push(
                        context,
                        new MaterialPageRoute(
                          builder: (context) =>  Saved_content(email),
                        ),
                      ),
                    }
                    else if(element['title'] == 'about us'){
                      Navigator.push(
                        context,
                        new MaterialPageRoute(
                          builder: (context) =>  AboutScreen(),
                        ),
                      ),
                    }
                    else if(element['title'] == 'log out'){
                      data.logout(),
                      Navigator.pushReplacement(
                        context,
                        new MaterialPageRoute(
                          builder: (context) =>  Login_final(),
                        ),
                      ),
                    }
                  },         
                ), 
              )).toList(),
            ), 
            Row(
              children: [
                Icon(Icons.settings,color: Colors.white,),
                SizedBox(width: 10,),
                Text('Settings',style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                SizedBox(width: 10,),
                Container(width: 2,height: 20,color: Colors.white,),
                SizedBox(width: 10,),
                Text('Log out',style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)
              ],
            )
          ],
        ),
      ),
    );
  }
  void getElement(String element){
    switch(element){
      case 'profile': {
        break;
      }
      // case 'about us': {
      //   Navigator.push(
      //     context,
      //     new MaterialPageRoute(
      //       builder: (context) =>  About_us(),
      //     ),
      //   );
      //   break;
      // }
    }
  }
}
