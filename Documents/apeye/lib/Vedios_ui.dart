import 'dart:math';

// import 'package:apeye/API/model/News_model.dart';
import 'package:apeye/WebView.dart';
import 'services/Video_services.dart';
import 'package:apeye/view_models/APIs/Vedios_view_model.dart';
import 'package:googleapis/people/v1.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

import 'API/model/Videos.dart';
import '/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:meta/meta.dart';
import 'app_bar/configuration.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_share/flutter_share.dart';

import '/API/model/load_data.dart';

// import 'package:url_launcher/url_launcher.dart';

class Vedios_ui extends StatefulWidget {
  String email;
  List interests;
  Vedios_ui(this.email, this.interests);
  @override
  State<StatefulWidget> createState() {
    return _Vedios_ui(email, interests);
  }
}

class _Vedios_ui extends State<Vedios_ui> {
  String email;
  List interests;
  _Vedios_ui(this.email, this.interests);

  DatabaseUserManager data = new DatabaseUserManager();

  String name_here = '';
  String description_here = '';
  String url_here = '';
  String image_here = '';
  String author_here = '';

  @override
  Widget build(BuildContext context) {
    print("##############@!!!!!!!!!!!!!!!!!!!!");
    print(interests);
    Provider.of<Vedios_view_model>(context, listen: false).fetchVedios(interests);

    return Consumer<Vedios_view_model>(
        builder: (context, Vedios_view_model vediosList, child) {
      print(vediosList.vediosList);
      String url;
      return Container(
        child: Column(
          children: <Widget>[
            for (Vedios vedios in vediosList.vediosList)
              Container(
                  child: InkWell(
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
                              // ),
                              // Container(
                              // child: Align(
                                // child: Hero(
                                    // tag:1,
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20), // Image border
                                        child: SizedBox.fromSize(
                                          size: Size.fromRadius(100), // Image radius
                                          child: Image.network(vedios.thumbnails, fit: BoxFit.cover),
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
                                      // Expanded(
                                        // child: new Row(
                                        //   children: [
                                            // Padding(padding: EdgeInsets.only(left: 10)),
                                            // CircleAvatar(
                                            //   // radius: 30.0,
                                            //   backgroundImage: NetworkImage(news.imageUrl),
                                            //   // backgroundColor: Colors.transparent,
                                            //   ),
                                              new Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Padding(padding: EdgeInsets.only(left: 5, top: 20)),
                                                  SizedBox(width: 120,
                                                   child:Text(vedios.title,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 8),),
                                                  ),Text(vedios.author,style: TextStyle(color: Colors.grey[600],fontWeight: FontWeight.bold, fontSize: 10),),                                             
                                    
                                                  // SizedBox(width: 10,),
                                                  // ),                         
                                            
                                                ],
                                              ),
                                            
                                      //     ],
                                      //   ),
                                      // ),                                  
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
                                                      // title_here = books.title;
                                                      // date_here = books.;
                                                      // description_here = news.description;
                                                      // image_here = news.imageUrl;
                                                      // url_here = news.articleUrl;
                                                      // // Map<String, Object?> mapAPI = {
                                                      //   'id' : 1,
                                                      //   'image': image_here,
                                                      //   'title': title_here, 
                                                      //   'date': date_here,
                                                      //   'description': description_here,
                                                        
                                                      // };
                                                      // Saved_content_model toDB = Saved_content_model(
                                                      //   id: 15,
                                                      //   image: image_here,
                                                      //   title: title_here, 
                                                      //   date: date_here,
                                                      //   description: description_here,
                                                      //   url: url_here,

                                                      // );
                                                      // print("*********************Author ...........");
                                                      // // print(books.authors);
                                                      // print(toDB.title);
                                                      // print("*********************");
                                                      // // onSelected(context, 1, toDB);
                                                      onSelected(context, 1, vedios.thumbnails, vedios.title, vedios.author, "", vedios.url);
                                                    }),
                                                    
                                                  },
                                                ),
                                                PopupMenuItem(
                                                  child: Text("Share"),
                                                  value: 2,
                                                  onTap: () => {
                                                    share(context, 2, vedios.url),
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
                                // Expanded(child:  Container(                                    
                                //   child: Column(
                                //     crossAxisAlignment: CrossAxisAlignment.start,
                                //     children: [
                                //       Padding(padding: EdgeInsets.only(left: 0, top: 20)),
                                //       Text('Description:',style: TextStyle(color: Colors.black, fontSize: 11,fontWeight: FontWeight.bold),),
                                //       Flexible(child: Text(books.description,style: TextStyle(color: Colors.grey,fontSize: 8,)),                                      )
                                      
                                //     ],  
                                //   ),
                                //   )
                                  
                                // ),
                              ],
                            ),
                          ), 
                        ),
                      ],
                      
                    ),
                                        
                    
                    
                    ),
                    onTap:() async =>{
                      url = vedios.url,
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
                )                
              ),
          ],
        ),
      );
    });
  }
  void onSelected(BuildContext context, int item, String image, String title, String time, String description, String url) async{      
    await data.SavedPost(email ,image, title, time, description, url);
  }

  Future<void> share(BuildContext context, int item, dynamic url) async{
    await FlutterShare.share(
      title: 'share post',
      text:  'share from apey',  
      linkUrl: url,
    );
  }
} 