import 'package:flutter/material.dart';

class checkbox extends StatefulWidget {    
  @override
  State<StatefulWidget> createState() {
    return new _check();
  }
}

class _check extends State<checkbox>{

  String text = "";
  void onSearch(){
    setState(() {
      text = "search";
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white24,
      drawer: new Drawer(
        child: new Container(
          child: new Column(
            children: [
              new FlatButton(onPressed: null, child: new Text("setting")),
              new FlatButton(onPressed: onSearch, child: new Text("saved post")),
              new FlatButton(onPressed: () {Navigator.of(context).pushNamed("/Login");}, child: new Text("logout")),
            ],
          ),
        )
      ),
      appBar: new AppBar(
        backgroundColor: Colors.white24,
        foregroundColor: Colors.black,
        leading: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.blueGrey,
            )
          ],
        ),
        // actions: [
        //   new IconButton(
        //   onPressed: null,
        //   icon: new Image.asset("img.png"),
        // ),
        // ],
        //title: new Text("Inform"),
        title:  Container(
          
          width: 150,
          height: 20,
          decoration: BoxDecoration(
            color: Colors.white24,
            borderRadius: BorderRadius.circular(15)),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search...",
                  hintStyle: TextStyle(fontSize: 15),
                  border: InputBorder.none
                ),
              ),
            ),
        ),
        // actions: [       
        //   IconButton(onPressed: onSearch, icon: Icon(Icons.notifications)),
        //   IconButton(onPressed: onSearch, icon: Icon(Icons.search)),
        // ],
      //),
      body: new Container(
        child: new Column(
          children: [
            new Row(
              children: [ 
                Padding(padding: EdgeInsetsDirectional.only(bottom: 50, start: 0, end: 20)),
               // new Card(borderOnForeground: true, child: new FlatButton(onPressed: onSearch, child: new Text("All"))),
                new Card( 
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(200.0)),
                  color: Colors.white.withOpacity(0.5),
                  child: new FlatButton(onPressed: onSearch, child: new Text("News")),
                ),
                new Card( 
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(200.0)),
                  color: Colors.white.withOpacity(0.5),
                  child: new FlatButton(onPressed: onSearch, child: new Text("Course")),
                ),
                new Card( 
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(200.0)),
                  color: Colors.white.withOpacity(0.5),
                  child: new FlatButton(onPressed: onSearch, child: new Text("Jobs")),
                ),
                new Card( 
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(200.0)),
                  color: Colors.white.withOpacity(0.5),
                  child: new FlatButton(onPressed: onSearch, child: new Text("Events")),
                ),
              ],
            ),
            new Column(       
            mainAxisAlignment: MainAxisAlignment.start,
              children: [ 
                Padding(padding: EdgeInsetsDirectional.only(start: 30)),
                //News card
                new Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                  borderOnForeground: true,

                  margin: EdgeInsetsDirectional.only(start: 20,end: 20, top: 20),
                  color: Colors.grey,
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      //new Text("News"),
                      new Column(
                        children: [
                          new Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          //new Icon(Icons.person),
                          new Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              new Text("\n\t\n\t\n\t"),
                              new Text("\n\t\n\t"),
                            //   new Text("Person Name"),
                            //   new Text("TH  12:1:00"),
                             ],
                          ), 
                        ], 
                      ),
                       //new Text("Alot of thing must say here cauze \n this is my new app \n I hope that you like it \n thank you")
                        ],
                      )
                      
                     
                    ],
                  ),
                ),
                //Course cards
                new Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                  borderOnForeground: true,
                  margin: EdgeInsetsDirectional.only(start: 20,end: 20, top: 10),
                  color: Colors.grey,
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      //new Text("course"),
                      new Row(
                        children:[
                          new Card(
                            color: Colors.white54,
                            
                            child: new Column(
                              children:[
                                new Text("\n\t\t"),
                                // new Text("Course Title"),
                                // new Text("\n course detail ")
                              ],
                            )  
                          ),
                          new Card(
                            color: Colors.white54,
                            child: new Column(
                              children:[
                                // new Text("Course Title"),
                                // new Text("\n course detail ")
                              ],
                            )
                          ),
                          new Card(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                            color: Colors.white54,
                            child: new Column(
                              children:[
                                // new Text("Course Title"),
                                // new Text("\n course detail ")
                              ],
                            )
                          ),
                          new Card(
                            color: Colors.white54,
                            child: new Column(  
                              children:[
                                // new Text("Course Title"),
                                // new Text("\n course detail ")
                              ],
                            )
                          ),  
                        ] 
                      ), 
                    ],
                  ),
                ),
                //jobs card
                new Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                  margin: EdgeInsetsDirectional.only(start: 20,end: 20, top: 10),
                  color: Colors.grey,
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      //new Text("Events"),
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          //new Icon(Icons.person),
                          new Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              new Text("\n\t\n\t\n\t"),
                              new Text("\n\t\n\t"),
                              // new Text("Person Name"),
                              // new Text("TH  12:1:00"),
                            ],
                          ),      
                        ], 
                      ),
                      //new Text("\n Alot of thing must say here cauze \n this is my new app \n I hope that you like it \n thank you")
                    ],
                  ),
                ),
                //events card
                new Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                  margin: EdgeInsetsDirectional.only(start: 20,end: 20, top: 10),
                  color: Colors.grey,
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      //new Text("Jobs"),
                      new Row(
                        children:[
                          new Card(
                            color: Colors.white,
                            child: new Column(
                              children:[
                                new Text("\n\t\t"),
                                // new Text("Job Title"),
                                // new Text("\n Job detail ")
                              ],
                            )
                          ),
                          new Card(
                            color: Colors.white,
                            child: new Column(
                              children:[
                                // new Text("Job Title"),
                                // new Text("\n Job detail ")
                              ],
                            )
                          ),
                          new Card(
                            color: Colors.white,
                            child: new Column(
                              children:[
                                // new Text("Job Title"),
                                // new Text("\n Job detail ")
                              ],
                            )
                          ),
                          new Card(
                            color: Colors.white,
                            child: new Column( 
                              children:[
                                // new Text("Job Title"),
                                // new Text("\n Job detail ")
                              ],
                            ),
                          ),  
                        ],
                      ), 
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

