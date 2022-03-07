// import 'package:provider/provider.dart';

import 'package:apeye/API/model/News.dart';
import 'package:apeye/services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:googleapis/servicecontrol/v2.dart';
import 'package:url_launcher/url_launcher.dart';

import '/DB/model/Saved_db_model.dart';
import '/DB/service/Saved_db.dart';
import 'package:apeye/view_models/APIs/News_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:googleapis/connectors/v1.dart';

import 'WebView.dart';
import 'app_bar/configuration.dart';


class Saved_content extends StatefulWidget {  
  String email;
  Saved_content(this.email);
  @override
  State<StatefulWidget> createState() {
    return _Saved_content(email);
  }
}

class _Saved_content extends State<Saved_content>{
  // late Saved_content_model saved;
  String email;
  _Saved_content(this.email);

  DatabaseUserManager data = new DatabaseUserManager();

  final CollectionReference posts = FirebaseFirestore.instance.collection('SavedPost_test');


  

  // late Future<dynamic> saved_post ;

  
  String title = '';
  String date = '';
  String description = '';

  

  // late Future<dynamic> saved_post= data.getSavedPostTitle('Noon@gmail.com').then((value) =>  {
  //       title = value["title"],
  //     date = value["date"],
  //     title = value["title"]
  //   })
  // ;

  // final querySnapshot = await posts.doc(email).get().then((DocumentSnapshot ds){
  //      title = ds.get('title');
  //     setState(() {
  //       title = 
  //     });
  //   });


  

  bool isLoading = false;
  
  @override
  void initState() {
   
    super.initState();

    

    



    refreshSaved();
  }

  @override
  void dispose(){
    SavedDatabase.instance.colse();

    super.dispose();
  }
  

  Future refreshSaved() async{
    setState(() {
      isLoading = true;
    });
    // this.saved = await SavedDatabase.instance.readContenet(15);

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    String url;
        final Stream<QuerySnapshot> _savedStream = FirebaseFirestore.instance.collection('SavedPost_test').where('email' , isEqualTo: email).snapshots();


    print("**************************");
          return Scaffold(  
          
        body: isLoading? Center (child: CircularProgressIndicator(),)
        : Container(
          
          color: Colors.grey[100],
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
            children: [
              SizedBox(height: 120,),
              SizedBox(child: new Text('Saved Post',style: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.bold),),),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                margin: EdgeInsets.symmetric(vertical: 30,horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20)
                ),
                
                child: Row(
                  children: [
                    Icon(Icons.search),
                    Text('Search...',style: TextStyle(color: Colors.grey,fontSize: 15,fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
              // for(Saved_content_model save in one_content)
              StreamBuilder<QuerySnapshot>(
      stream: _savedStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {

       if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return Wrap(
          // spacing: 8.0, // gap between adjacent chips
          runSpacing: 4.0, // gap between lines
          children: snapshot.data!.docs.map((DocumentSnapshot document) {            
            Map<String, dynamic> data = document.data()! as Map<String,dynamic>;
            print(data);
            return Container(              
                padding: EdgeInsets.all(10),
                child: Column(                        
                  children: [  
                    new Slidable(
                       endActionPane: ActionPane(
                          motion: const ScrollMotion(),
                          children:  [
                            SlidableAction(
                              onPressed: (context) {
                                delete(email, data['title']);
                              } ,
                              backgroundColor: Color(0xFFFE4A49),
                              foregroundColor: Colors.white,
                              icon: Icons.delete,
                            ),
                          ],
                        ),
                      child:         
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
                                            SizedBox(height: 140, width: 370,
                                            child: InkWell(
                                            child: new Card(      
                                          //news
                                              
                                              margin: EdgeInsets.only(left: 10.0,right: 10.0, bottom: 10.0, top: 10.0),
                                              
                                              child: new Column(
                                                children: [
                                                  
                                                  new Row(
                                                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                     Padding(padding: EdgeInsets.only ( bottom: 10, top: 10)),
                                                          new Text(
                                                            data['title'],
                                                            style: TextStyle(
                                                              fontWeight: FontWeight.bold,
                                                              fontSize: 6,
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
                                                        Text(data['description'],style: TextStyle(color: Colors.grey,fontSize: 8,)),                                      
                                                      ],  
                                                    ), 
                                                  ),
                                            ],
                                              

                                     
                                                  // new Text(jobs.snippet),
                                                  
                                                
                                            ),
                                            ),
                                            onTap:() async =>{
                                              url = data['url'],
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
                              ],
                           ),
                                          ],
                      ),
                                  
                  ),
              ),
                    ),
                  ],
                ),
                  );
                }).toList(),
              );
              },
            ),
          ]),
        ),
      ),
    ); 
  }
  void delete(String email, String title_to_delete) async {
    DatabaseUserManager db_obj = new DatabaseUserManager();
    await db_obj.delete_save_post(email,title_to_delete);

    
  }
  
}