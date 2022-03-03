import 'dart:math';

import 'package:apeye/API/model/Jobs_model.dart';
import 'package:apeye/DB/model/Saved_db_model.dart';
import 'package:apeye/DB/service/Saved_db.dart';
import 'package:apeye/services/Jobs_services.dart';
import 'package:apeye/view_models/APIs/Jobs_view_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:googleapis/people/v1.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

import 'API/model/Jobs.dart';
import '/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:meta/meta.dart';
import 'WebView.dart';
import 'app_bar/configuration.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '/API/model/load_data.dart';


// import 'package:url_launcher/url_launcher.dart';


class Jobs_ui extends StatefulWidget { 
  @override
  State<StatefulWidget> createState() {

    return _Jobs_ui();
  }
}

class _Jobs_ui extends State<Jobs_ui>{

  Jobs_view_model model = Jobs_view_model();

  DatabaseUserManager data = new DatabaseUserManager();



  String name_here = '';
  String title_here='';
  String date_here='';
  String description_here='';
  String image_here='';
  String url_here = '';
  
//  MultiProvider(
//   providers: [
//       ChangeNotifierProvider<Jobs_view_model>(
//         create: (context) => Jobs_ui(),
//         // child: ,
//       ),
//       ChangeNotifierProvider<Jobs_view_model_management >(
//         create: (_) => Jobs_ui_management() ,
//       ),
//   ],

  @override
  Widget build(BuildContext context) {
  //   MultiProvider(
  // providers: [
  //   ChangeNotifierProvider<Jobs_view_model>(
  //                           create: (context) => Jobs_view_model(),
  //                           builder: (context, child) => Jobs_ui(), 
  //   ),
  //   ChangeNotifierProvider<Jobs_view_model>(
  //                           create: (context) => Jobs_view_model(),
  //                           // builder: (context, child) => Jobs_ui_management(), 
  //   ),
  // ],
  //   );

    Provider.of<Jobs_view_model>(context, listen: false).fetchJobs();  
    // Provider.of<Jobs_view_model_management>(context, listen: false).fetchJobs();  
    
    return Consumer<Jobs_view_model>(builder: (context, Jobs_view_model jobsList , child) {
      print("******************** jobsList.jobsList ***************");
      print(jobsList.jobsList);
      String url;
      return Container(       
        child: Column(
          children: <Widget>[
            SizedBox(height: 20,),
            for (Jobs jobs in jobsList.jobsList)
              Container(     
                child: InkWell(     
                child: GestureDetector(
                  child:
                  Container(
                    height: 240,
                    margin: EdgeInsets.symmetric(horizontal: 20),                  
                    
                      child: Row(
                        children: [
                        
                        // Expanded(
                        //   child: Stack(
                        //     children: [
                        //       Container(
                        //         decoration: BoxDecoration(color: Colors.lightBlue[900],
                        //         borderRadius: BorderRadius.circular(20),
                        //           boxShadow: shadowList,
                        //         ),
                        //         margin: EdgeInsets.only(top: 40),
                        //       // ),
                        //       // Container(
                        //       // child: Align(
                        //         // child: Hero(
                        //             // tag:1,
                        //          child:   Container(
                        //         decoration: BoxDecoration(color: Colors.lightBlue[900],
                        //         borderRadius: BorderRadius.circular(20),
                        //           boxShadow: shadowList,
                                   
                                       
                        //         ),
                        //         child: SizedBox.fromSize(
                        //                   size: Size.fromRadius(100), // Image radius
                                          
                        //                   // child: Image.asset('', fit: BoxFit.cover),
                        //                 ),
                                  
                                    
                                      
                        //               // fit: BoxFit.fitHeight,
                                      
                                        

                        //               ),
                        //         // ),
                        //         // ),
                        //       // ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                           Column(
                              children: [
                                // Container(
                                //   child: Row(
                                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                //     children: [
                                //       Expanded(child: 
                                //         new Row(
                                //           children: [
                                //             Padding(padding: EdgeInsets.only(left: 10)),
                                //             // CircleAvatar(
                                //             //   // radius: 30.0,
                                //             //   backgroundImage: NetworkImage(news.imageUrl),
                                //             //   // backgroundColor: Colors.transparent,
                                //             //   ),
                                //               new Column(
                                //                 children: [
                                //                   SizedBox(width: 10,),
                                //                   Text(jobs.title,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),                                                                                    
                                //                   // Text(news.date,style: TextStyle(color: Colors.grey[600],fontWeight: FontWeight.bold, fontSize: 10),),                                          
                                            
                                //                 ],
                                //               ),
                                            
                                //           ],
                                //         ),
                                //       ),                                  
                                //       Container( 
                                //         margin: EdgeInsets.only(right: 10),     
                                //         child: Stack(                       
                                //           children: <Widget>[          
                                //             PopupMenuButton( 
                                //               icon: Icon(Icons.more_horiz,),
                                //               itemBuilder: (context) =>[
                                //                 PopupMenuItem(
                                //                   child: Text("Save"),
                                //                   value: 1,
                                //                   onTap: () => {
                                //                     setState(() {
                                //                       // String id_here = news.id;
                                //                       title_here = jobs.title;
                                //                       date_here = jobs.link;
                                //                       description_here = jobs.snippet;
                                //                       // image_here = news.imageUrl;
                                //                       // url_here = news.articleUrl;

                                //                       // Map<String, Object?> mapAPI = {
                                //                       //   'id' : 1,
                                //                       //   'image': image_here,
                                //                       //   'title': title_here, 
                                //                       //   'date': date_here,
                                //                       //   'description': description_here,
                                                        
                                //                       // };
                                //                       Saved_content_model toDB = Saved_content_model(
                                //                         id: 15,
                                //                         image: image_here,
                                //                         title: title_here, 
                                //                         date: date_here,
                                //                         description: description_here,

                                //                       );
                                //                       print("*********************");
                                //                       print(toDB.title);
                                //                       print("*********************");
                                //                       onSelected(context, 1, toDB);
                                //                     }),
                                                    
                                //                   },
                                //                 ),
                                //                 PopupMenuItem(
                                //                   child: Text("Share"),
                                //                   value: 2,
                                //                   onTap: () => {
                                //                     // onSelected(context, 2),
                                //                   },
                                //                 ),
                                //               ],                                          
                                //             ),                                                                
                                //           ],
                                //         ),
                                //       ),
                                //     ],
                                //   ),
                                // ),
                                
                                new  Container(
                                decoration: BoxDecoration(color: Colors.lightBlue[900],
                                borderRadius: BorderRadius.circular(20),
                                  boxShadow: shadowList,
                                ),
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.vertical,
                                    child: new Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      //all
                                      children: [
                                        // Padding(padding: EdgeInsets.only(top: 10.0)),
                                        new Column(
                                          children: [
                                            SizedBox(height: 20,),
                                            SizedBox(height: 170, width: 370,
                                            child: new Card(      
                                          //news
                                              
                                              margin: EdgeInsets.only(left: 10.0,right: 10.0, bottom: 10.0, top: 10.0),
                                              
                                              child: new Column(
                                                children: [
                                                  new Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  new Row(
                                                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                     Padding(padding: EdgeInsets.only ( bottom: 10, top: 10)),
                                                          new Text(
                                                            jobs.title,
                                                            style: TextStyle(
                                                              fontWeight: FontWeight.bold,
                                                              fontSize: 9,
                                                            ),
                                                          ),
                                                        
                                                    ],
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
                                                                setState(() {
                                                                  // String id_here = news.id;
                                                                  title_here = jobs.title;
                                                                  date_here = jobs.link;
                                                                  description_here = jobs.snippet;
                                                                  // image_here = news.imageUrl;
                                                                  // url_here = news.articleUrl;

                                                                  // Map<String, Object?> mapAPI = {
                                                                  //   'id' : 1,
                                                                  //   'image': image_here,
                                                                  //   'title': title_here, 
                                                                  //   'date': date_here,
                                                                  //   'description': description_here,
                                                                    
                                                                  // };
                                                                  Saved_content_model toDB = Saved_content_model(
                                                                    id: 15,
                                                                    image: image_here,
                                                                    title: title_here, 
                                                                    date: date_here,
                                                                    description: description_here,

                                                                  );
                                                                  print("*********************");
                                                                  print(toDB.title);
                                                                  print("*********************");
                                                      onSelected(context, 1, image_here, title_here, date_here, description_here);
                                                                }),
                                                                
                                                              },
                                                            ),
                                                            PopupMenuItem(
                                                              child: Text("Share"),
                                                              value: 2,
                                                              onTap: () => {
                                                                // onSelected(context, 2),
                                                              },
                                                            ),
                                                          ],                                          
                                                        ),                                                                
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Container(                                    
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                     Padding(padding: EdgeInsets.all(10)),

                                                        // Padding(padding: EdgeInsets.only(left: 20, top: 20)),
                                                        Text('Description:',style: TextStyle(color: Colors.black, fontSize: 11,fontWeight: FontWeight.bold),),
                                                        Text(jobs.snippet,style: TextStyle(color: Colors.grey,fontSize: 8,)),                                      
                                                      ],  
                                                    ), 
                                                  ),
                                            ],
                                              

                                     
                                                  // new Text(jobs.snippet),
                                                  
                                                
                                            ),
                                            ),
                                            // ),
                                          
                                        
                                      
                                    ), 
                                  // ),
                                // ],
                              // ),
                          //  ),
                        // ),
                      // ],
                    // ),
                  // ),
                // ),
                                          ],
                           ),
                                          ],
                      ),
                                  
                  ),
              ),
                                          ],
            ),
                    
          ],
        ),
                  ),
                  onTap:() async =>{
                      url = jobs.link,
                      if (await canLaunch(url)){
                        print("Hello NOOOOOOOOOOn"),
                        Navigator.push(
                          context,
                          new MaterialPageRoute(
                            builder: (context) => new WebViewLoad(url),
                          ),
                        ),
                        // await launch(url),
                        }
                      else 
                        // can't launch url, there is some error
                        throw "Could not launch ",
                    },  
                ),
                ),
              ),
          ]
        )

      );
    
      }
    );
  }
 void onSelected(BuildContext context, int item, String image, String title, String time, String description) async{
     switch(item){
        case 1:{
          // await SavedDatabase.instance.create(toDB);
          await data.SavedPost('Noon@gmail.com',image, title, time, description);
          // print('*****************************'+ toDB.title);
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