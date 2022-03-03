// import 'package:provider/provider.dart';

import 'package:apeye/API/model/News.dart';
import 'package:apeye/services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:googleapis/servicecontrol/v2.dart';

import '/DB/model/Saved_db_model.dart';
import '/DB/service/Saved_db.dart';
import 'package:apeye/view_models/APIs/News_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:googleapis/connectors/v1.dart';


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
    final Stream<QuerySnapshot> _savedStream = FirebaseFirestore.instance.collection('SavedPost_test').where('email' , isEqualTo: 'Noon@gmail.com').snapshots();


  

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
    // Provider.fromJson(Saved_content_model); 
    
    // return Consumer<News_view_model>(builder: (context, News_view_model newsList , child) {
    // initState();
    // refreshSaved();
    

    print("**************************");
    // print(saved.title);
    
    
          // return Text("Full Name: ${data['title']} ${data['description']}");

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
                    new Container(
                      
                      // padding: EdgeInsets.only(top: 20,left: 20, right: 50, bottom: 30),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20))                                              
                      ),
                      height: 200,
                      child: Slidable(                      
                        endActionPane: ActionPane(
                          motion: const ScrollMotion(),
                          children: const [
                            SlidableAction(
                              onPressed: null,
                              backgroundColor: Color(0xFFFE4A49),
                              foregroundColor: Colors.white,
                              icon: Icons.delete,
                            ),
                          ],
                        ),
                        
                        child: new Row(
                          children: [
                            Image.network(data['image'], height: 100,),
                            // SizedBox(width: 30,),
                            new Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                new Column(
                                  children: [
                                    Text(data['title'],style: TextStyle(color: Colors.black,fontSize: 10,fontWeight: FontWeight.bold),),                                                                                    
                                    Text(data['time'],style: TextStyle(color: Colors.grey[600],fontWeight: FontWeight.bold, fontSize: 10),),                                          
                                                      
                                  ],
                                ),
                                new Column(
                                  children: [
                                    Text('description:',style: TextStyle(color: Colors.black,fontSize: 10,fontWeight: FontWeight.bold),),                                                                                    
                                    Text(data['description'],style: TextStyle(color: Colors.grey[600],fontWeight: FontWeight.bold, fontSize: 10),),                                                                                                        
                                  ],
                                ),                          
                              ],
                            ),
                          ],
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
//  delete() async {
//     await SavedDatabase.instance.delete(15);
//   }
  
}