import 'dart:math';

import 'package:apeye/Login_final.dart';
import 'package:apeye/menuitem.dart';
import 'package:apeye/services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'Home.dart';

class All extends StatefulWidget { 
  
  @override
  State<StatefulWidget> createState() {
    return _All();
  }
}

class _All extends State<All>{
    DatabaseUserManager data = new DatabaseUserManager();


  @override
  Widget build(BuildContext context) {
    return Container(
     child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children : [
            new Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(top: 20),
            // height: 360,
             decoration: BoxDecoration(                       
                borderRadius: BorderRadius.circular(10),
                color: Colors.white
             ),
            child: new Column(
              children: [
                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    new Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 10, top: 10),
                          child: CircleAvatar(backgroundColor: Colors.yellow,backgroundImage: ExactAssetImage('assets/images/welcome.jpg'),),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10, top: 10),
                          child: new Text(
                            "Name",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                            ),
                          ),
                        ), 
                      ],     
                    ),
                    Container( 
                      margin: EdgeInsets.only(right: 10),     
                      // child: Expanded(
                        child: Stack(                       
                        children: <Widget>[          
                          // Positioned(
                            // right: 0.0,
                            // top: 0.0,              
                            PopupMenuButton( 
                              
                              
                          //     onSelected: (menuVal) async {
                          // // setState(() async{
                          //   switch(menuVal){
                          //     case 'save':{
                          //       await data.save_post('JCmzvelIXAy15O0j4dlX','name');
                          //       print(save);
                          //     break;
                          //     }        
                            // }    
                        // // },  
                        // child: IconButton(
                        //   onPressed: () {},
                           icon: Icon(Icons.more_horiz,
                           
                          //  ),
                        ),

                           itemBuilder: (context) =>[
                             PopupMenuItem(
                               child: Text("Save"),
                               value: 1,
                               onTap: () => {
                                 onSelected(context, 1),
                               },
                             ),
                             PopupMenuItem(
                               child: Text("Share"),
                               value: 2,
                               onTap: () => {
                                 onSelected(context, 2),
                               },
                             ),
                           ],                                          
                      ),                          
                        
                        ]
                      ),
                    
                    ),          
                       
                    
                  ],
                ),
                
                Container(
                  margin: EdgeInsets.only(top: 10),                    
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(bottom: 30),
                        child: new Text("Here is  the post \n from user"),
                      ),
                      Container(
                        // child : Image.asset("assets/images/Engineer.PNG", height: MediaQuery.of(context).size.height-660,),
                      ),                    
                    ],
                  ),    
                ), 
              ],
            ),
          ),

          Container(         
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(top: 20),
             decoration: BoxDecoration(                       
                borderRadius: BorderRadius.circular(10),
                color: Colors.white
             ),
            child: new Column(
              children: [
                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    new Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 10, top: 10),
                          child: CircleAvatar(backgroundColor: Colors.yellow,backgroundImage: ExactAssetImage('assets/images/Engineer.PNG')),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10, top: 10),
                          child: new Text(
                            "Name",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                            ),
                          ),
                        ),                                
                      ],     
                    ),
                    Container(
                        margin: EdgeInsets.only(right: 10),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.more_horiz),
                        ),
                    ),
                  ],
                ),                                                  
               Container(
                    
                    margin: EdgeInsets.only(top: 10),                            
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,                                
                      children: [
                        Container(
                          padding: EdgeInsets.only(bottom: 30),
                          child: new Text("Here is  the post \n from user"),
                        ),                                                                    
                        Container(
                          child: Image.asset("assets/images/search.png",  height: MediaQuery.of(context).size.height-560),
                        ),
                        
                      ],                                
                    ),  
                  ), 
                              
              ],
            ),
          ),
          ], 
          

          
         
        ),
      ), 
    );
    
  }
  void onSelected(BuildContext context, int item) async{
     switch(item){
        case 1:{
          await data.save_post('id','url');
          print('*****************************');
        break;
        }
        case 2:{
          // await data.save_post('hiiii','url');
          print('***************************** Share ');
        break;
        }               
    }
  }
} 