import 'dart:math';

import 'package:apeye/DB/model/Saved_db_model.dart';
import 'package:apeye/view_models/APIs/testJobs_view_model.dart';
import 'package:googleapis/admin/directory_v1.dart';
import 'view_models/APIs/testJobs_view_model.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:provider/provider.dart';

import 'API/model/Jobs.dart';
import '/services/auth.dart';
import 'package:flutter/material.dart';
import 'WebView.dart';
import 'app_bar/configuration.dart';
import 'package:url_launcher/url_launcher.dart';

class Jobs_ui extends StatefulWidget {
  String email;
  List interests;
  Jobs_ui(this.email, this.interests);
  @override
  State<StatefulWidget> createState() {
    return _Jobs_ui(email, interests);
  }
}

class _Jobs_ui extends State<Jobs_ui> {
  String email;
  List interests;
  _Jobs_ui(this.email, this.interests);

  DatabaseUserManager data = new DatabaseUserManager();

  String name_here = '';
  String title_here = '';
  String date_here = '';
  String description_here = '';
  String image_here = '';
  String url_here = '';

  @override
  Widget build(BuildContext context) {
    Provider.of<testJobs_view_model>(context, listen: false).fetchJobs(interests);
    return Consumer<testJobs_view_model>(
        builder: (context, testJobs_view_model jobsList, child) {
          print("interest in job_ui"+interests.toString());
      print("******************** jobsList.jobsList ***************");
      print(jobsList.jobsList);
      String url;
      return Container(
          child: Column(children: <Widget>[
        SizedBox(
          height: 20,
        ),
        for (Jobs jobs in jobsList.jobsList)
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
                              margin: EdgeInsets.only(top: 40),
                            // ),
                            // Container(
                            // child: Align(
                              // child: Hero(
                                  // tag:1,
                               child:   Container(
                              decoration: BoxDecoration(color: Colors.lightBlue[900],
                              borderRadius: BorderRadius.circular(20),
                                boxShadow: shadowList,

                              ),
                              child: SizedBox.fromSize(
                                        size: Size.fromRadius(100), // Image radius

                                        // child: Image.asset(jobs.'', fit: BoxFit.cover),
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

                          new Container(
                            decoration: BoxDecoration(
                              color: Colors.lightBlue[900],
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
                                      SizedBox(
                                        height: 20,
                                      ),
                                      SizedBox(
                                        height: 170, width: 370,
                                        child: new Card(
                                          //news

                                          margin: EdgeInsets.only(
                                              left: 10.0,
                                              right: 10.0,
                                              bottom: 10.0,
                                              top: 10.0),

                                          child: new Column(
                                            children: [
                                              new Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  new Row(
                                                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  bottom: 10,
                                                                  top: 10)),
                                                      new Text(
                                                        jobs.title,
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 9,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        right: 10),
                                                    child: Stack(
                                                      children: <Widget>[
                                                        PopupMenuButton(
                                                          icon: Icon(
                                                            Icons.more_horiz,
                                                          ),
                                                          itemBuilder:
                                                              (context) => [
                                                            PopupMenuItem(
                                                              child:
                                                                  Text("Save"),
                                                              value: 1,
                                                              onTap: () => {
                                                                setState(() {
                                                                  // String id_here = news.id;
                                                                  title_here =
                                                                      jobs.title;
                                                                  date_here =
                                                                      jobs.link;
                                                                  description_here =
                                                                      jobs.snippet;
                                                                  // image_here = news.imageUrl;
                                                                  // url_here = news.articleUrl;

                                                                  // Map<String, Object?> mapAPI = {
                                                                  //   'id' : 1,
                                                                  //   'image': image_here,
                                                                  //   'title': title_here,
                                                                  //   'date': date_here,
                                                                  //   'description': description_here,

                                                                  // };
                                                                  Saved_content_model
                                                                      toDB =
                                                                      Saved_content_model(
                                                                    id: 15,
                                                                    image:
                                                                        image_here,
                                                                    title:
                                                                        title_here,
                                                                    date:
                                                                        date_here,
                                                                    description:
                                                                        description_here,
                                                                    url: jobs
                                                                        .link,
                                                                  );
                                                                  print(
                                                                      "*********************");
                                                                  print(toDB
                                                                      .title);
                                                                  print(
                                                                      "*********************");
                                                                  onSelected(
                                                                      context,
                                                                      1,
                                                                      image_here,
                                                                      title_here,
                                                                      date_here,
                                                                      description_here,
                                                                      jobs.link);
                                                                }),
                                                              },
                                                            ),
                                                            PopupMenuItem(
                                                              child:
                                                                  Text("Share"),
                                                              value: 2,
                                                              onTap: () => {
                                                                share(
                                                                    context,
                                                                    2,
                                                                    jobs.link),
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
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.all(10)),

                                                    // Padding(padding: EdgeInsets.only(left: 20, top: 20)),
                                                    Text(
                                                      'Description:',
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 11,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Text(jobs.snippet,
                                                        style: TextStyle(
                                                          color: Colors.grey,
                                                          fontSize: 8,
                                                        )),
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
                onTap: () async => {
                  url = jobs.link,
                  if (await canLaunch(url))
                    {
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
      ]));
    });
  }

  void onSelected(BuildContext context, int item, String image, String title,
      String time, String description, String url) async {
    await data.SavedPost(email, image, title, time, description, url);
  }

  Future<void> share(BuildContext context, int item, dynamic url) async {
    await FlutterShare.share(
      title: 'share post',
      text: 'share from apey',
      linkUrl: url,
    );
  }
}