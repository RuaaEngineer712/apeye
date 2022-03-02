// import 'package:provider/provider.dart';

import 'package:apeye/API/model/News.dart';

import '/DB/model/Saved_db_model.dart';
import '/DB/service/Saved_db.dart';
import 'package:apeye/view_models/APIs/News_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:googleapis/connectors/v1.dart';


class Saved_content extends StatefulWidget {  
  @override
  State<StatefulWidget> createState() {
    return _Saved_content();
  }
}

class _Saved_content extends State<Saved_content>{
  late Saved_content_model saved;
  


  bool isLoading = false;
  
  @override
  void initState(){
   
    super.initState();

    refreshSaved();
  }

  // @override
  // void dispose(){
  //   SavedDatabase.instance.colse();

  //   super.dispose();
  // }
  

  Future refreshSaved() async{
    setState(() {
      isLoading = true;
    });
    this.saved = await SavedDatabase.instance.readContenet('The Wall Street Journal');

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Provider.fromJson(Saved_content_model); 
    
    // return Consumer<News_view_model>(builder: (context, News_view_model newsList , child) {
    initState();
    // refreshSaved();


    print("**************************");
    print(saved.title);
    
    
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
            
            Container(              
              padding: EdgeInsets.all(30),
              child: Column(                        
                children: [          
                  new Container(
                    
                    // padding: EdgeInsets.only(top: 20,left: 20, right: 50, bottom: 30),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20))                                              
                    ),
                    height: 100,
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
                          Image.asset(saved.image, width: 100,),
                          SizedBox(width: 30,),
                          new Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              new Column(
                                children: [
                                  Text(saved.title,style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),                                                                                    
                                  Text(saved.date,style: TextStyle(color: Colors.grey[600],fontWeight: FontWeight.bold, fontSize: 10),),                                          
                                                    
                                ],
                              ),
                              new Column(
                                children: [
                                  Text('description:',style: TextStyle(color: Colors.black,fontSize: 10,fontWeight: FontWeight.bold),),                                                                                    
                                  Text(saved.description,style: TextStyle(color: Colors.grey[600],fontWeight: FontWeight.bold, fontSize: 10),),                                                                                                        
                                ],
                              ),                          
                            ],
                          ),
                        ],
                      ), 
                    ),
                  ),
                  SizedBox(height: 30,),
                  new Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20))                                              
                    ),
                    
                    padding: EdgeInsets.all(10),
                    height: 100,
                    child: Slidable(
                      endActionPane: ActionPane(
                        motion: ScrollMotion(),
                        children: [
                          SlidableAction(
                            onPressed: delete(),
                            backgroundColor: Color(0xFFFE4A49),
                            foregroundColor: Colors.white,
                            icon: Icons.delete,
                          ),
                        ],
                      ),
                      child: new Row(
                        children: [
                          Image.asset('assets/images/test.jpg', width: 100,),
                          SizedBox(width: 30,),
                          new Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              new Column(
                                children: [
                                  Text('title:',style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),                                                                                    
                                  Text('date',style: TextStyle(color: Colors.grey[600],fontWeight: FontWeight.bold, fontSize: 10),),                                          
                                                    
                                ],
                              ),
                              new Column(
                                children: [
                                  Text('description:',style: TextStyle(color: Colors.black,fontSize: 10,fontWeight: FontWeight.bold),),                                                                                    
                                  Text('description',style: TextStyle(color: Colors.grey[600],fontWeight: FontWeight.bold, fontSize: 10),),                                                                                                        
                                ],
                              ),                          
                            ],
                          ),
                        ],
                      ), 
                    ),
                  ),
                  SizedBox(height: 30,),
                  new Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20))                                              
                    ),
                    padding: EdgeInsets.all(10),
                    height: 100,
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
                          Image.asset('assets/images/test.jpg', width: 100,),
                          SizedBox(width: 30,),
                          new Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              new Column(
                                children: [
                                  Text('title:',style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),                                                                                    
                                  Text('date',style: TextStyle(color: Colors.grey[600],fontWeight: FontWeight.bold, fontSize: 10),),                                          
                                                    
                                ],
                              ),
                              new Column(
                                children: [
                                  Text('description:',style: TextStyle(color: Colors.black,fontSize: 10,fontWeight: FontWeight.bold),),                                                                                    
                                  Text('description',style: TextStyle(color: Colors.grey[600],fontWeight: FontWeight.bold, fontSize: 10),),                                                                                                        
                                ],
                              ),                          
                            ],
                          ),
                        ],
                      ), 
                    ),
                  ),
                  SizedBox(height: 30,),
                  new Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20))                                              
                  ),
                  padding: EdgeInsets.all(10),
                  height: 100,
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
                        Image.asset('assets/images/test.jpg', width: 100,),
                        SizedBox(width: 30,),
                        new Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            new Column(
                              children: [
                                Text('title:',style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),                                                                                    
                                Text('date',style: TextStyle(color: Colors.grey[600],fontWeight: FontWeight.bold, fontSize: 10),),                                          
                                                  
                              ],
                            ),
                            new Column(
                              children: [
                                Text('description:',style: TextStyle(color: Colors.black,fontSize: 10,fontWeight: FontWeight.bold),),                                                                                    
                                Text('description',style: TextStyle(color: Colors.grey[600],fontWeight: FontWeight.bold, fontSize: 10),),                                                                                                        
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
            ),
          ],
        ),
        ),
      ),
    );
  }
 delete() async {
    await SavedDatabase.instance.delete('The Wall Street Journal');
  }
  
}