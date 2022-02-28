import 'dart:math';

import 'package:apeye/API/model/News_model.dart';
import 'package:apeye/services/News_services.dart';
import 'package:apeye/view_models/APIs/news_view_model.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

import 'API/model/News.dart';
import '/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:meta/meta.dart';
import 'app_bar/configuration.dart';
import 'package:intl/intl.dart';

import '/API/model/load_data.dart';


// import 'package:url_launcher/url_launcher.dart';


class All extends StatefulWidget { 
  @override
  State<StatefulWidget> createState() {

    return _All();
  }
}

class _All extends State<All>{
  News_view_model model = News_view_model();

  DatabaseUserManager data = new DatabaseUserManager();


  @override
  Widget build(BuildContext context) {

    Provider.of<News_view_model>(context, listen: false).fetchNews();  
    
    return Consumer<News_view_model>(builder: (context, News_view_model newsList , child) {
      print(newsList.newsList);
      return Container(       
        child: Column(
          children: <Widget>[
            for (News news in newsList.newsList)
              Container(          
                child: GestureDetector(
                  child: 
                  
                  Container(
                    height: 240,
                    margin: EdgeInsets.symmetric(horizontal: 20),                  
                    child: InkWell(
                      child: Row(
                        children: [
                        // newsList.newsList.map((news) => {
                        Expanded(
                          child: Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(color: Colors.lightBlue[900],
                                borderRadius: BorderRadius.circular(20),
                                  boxShadow: shadowList,
                                ),
                                margin: EdgeInsets.only(top: 50),
                              // ),
                              // Container(
                              // child: Align(
                                // child: Hero(
                                    // tag:1,
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20), // Image border
                                        child: SizedBox.fromSize(
                                          size: Size.fromRadius(100), // Image radius
                                          child: Image.network(news.imageUrl, fit: BoxFit.cover),
                                        ),
                                      
                                      // fit: BoxFit.fitHeight,
                                      
                                        

                                      ),
                                // ),
                                // ),
                              // ),
                              ),
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
                                            // CircleAvatar(
                                            //   // radius: 30.0,
                                            //   backgroundImage: NetworkImage(news.imageUrl),
                                            //   // backgroundColor: Colors.transparent,
                                            //   ),
                                              new Column(
                                                children: [
                                                  SizedBox(width: 10,),
                                                  Text('title',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),                                                                                    
                                                  Text(news.date,style: TextStyle(color: Colors.grey[600],fontWeight: FontWeight.bold, fontSize: 10),),                                          
                                            
                                                ],
                                              ),
                                            
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
                                      Text(news.description,style: TextStyle(color: Colors.grey,fontSize: 8,)),                                      
                                    ],  
                                  ),  
                                ),
                              ],
                            ),
                          ), 
                        ),
                      
                      
                      ],
                    ),                      
                    ),
                  ),
                )                
              ),
          ],
        ),
      );
    });
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