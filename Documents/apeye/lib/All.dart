import 'dart:math';

import '/API/model/job.dart';
import '/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:meta/meta.dart';
import 'app_bar/configuration.dart';
import 'package:intl/intl.dart';

import '/API/model/load_data.dart';


// import 'package:url_launcher/url_launcher.dart';


class All extends StatefulWidget { 
  // late Jobs jobs;
  // All({Key? key, required Jobs Jobs}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    //from APIs...
    // _All().setAvatar("assets/images/test.jpg");
    // _All().setName("Ruaa");
    // _All().setDate(DateTime.now());
    // _All().setDescription("here is description");
    // _All().setLink("youtube.com");
    

    return _All();
  }
}

class _All extends State<All>{
  DatabaseUserManager data = new DatabaseUserManager();

  String avatar = '';
  String name = '';
  // // DateFormat year = DateFormat().add_y();
  // int month = 2;
  // int day = 23;

  String image_url = '';

  DateTime dateToday = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, DateTime.now().hour) ; 
  String description = "";

  String link = "";

  String setAvatar(String getAvatar){
    setState(() {
      getAvatar = avatar;      
    });
    return getAvatar;
  }

  String setName(String getName){
    setState(() {
      getName = name;
    });
    return getName;
  }

  String imageUrl(String getImage){
    setState(() {
      getImage = image_url;
    });
    return getImage;
  }

  DateTime setDate(DateTime getDate){
    setState(() {
      getDate = dateToday;
    });
    return getDate;
  }

  String setDescription(String getdescription){
    setState(() {
      getdescription = description;
    });
    return getdescription;
  }

  String setLink(String getLink){
    setState(() {
      getLink = link;
    });
    return getLink;
  }

  // _All(this.image_url, this.name, this.dateToday, this.description, this.link);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(          
          child: GestureDetector(
              child: Container(
                height: 240,
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(color: Colors.lightBlue[900],
                            borderRadius: BorderRadius.circular(20),
                              boxShadow: shadowList,
                            ),
                            margin: EdgeInsets.only(top: 50),
                          ),
                          Align(
                            // child: Hero(
                            //     tag:1,child: Image.asset("assets/images/test.jpg"),
                            // ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(top: 60,bottom: 20),
                        decoration: BoxDecoration(color: Colors.white,

                        boxShadow: shadowList,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20)
                          )
                        ),
                        child: Column(
                          children: [
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(child: 
                                    new Row(
                                      children: [
                                        Padding(padding: EdgeInsets.only(left: 10)),
                                        CircleAvatar(backgroundImage: ExactAssetImage("assets/images/test.jpg")),
                                        SizedBox(width: 10,),
                                          Text('title',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),                                          
                                      ],
                                    ),
                                  ),                                  
                                  Container( 
                                    margin: EdgeInsets.only(right: 10),     
                                    child: Stack(                       
                                      children: <Widget>[          
                                        PopupMenuButton( 
                                          icon: Icon(Icons.more_horiz,),
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
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            Container(                                    
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(padding: EdgeInsets.only(left: 0, top: 20)),
                                  Text('Description:',style: TextStyle(color: Colors.black, fontSize: 11,fontWeight: FontWeight.bold),),
                                  Text("Description",style: TextStyle(color: Colors.grey,fontSize: 8,)),                                      
                                ],  
                              ),  
                            ),
                          ],
                        ),
                      ), 
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
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