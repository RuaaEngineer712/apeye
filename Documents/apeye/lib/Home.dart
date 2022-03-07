import 'package:flutter/material.dart';
import 'All.dart';
import 'Menu.dart';



class Home extends StatelessWidget {    
  String email;
  
  Home(this.email);
  
      

  @override
  Widget build(BuildContext context) {    
    return Scaffold(
      // backgroundColor: Colors.black12,

        
      
      body:
      
         new Container(
            //row one
            
            child: new Column(
            
              children: [
                
                // IconButton(
                //         onPressed: null,
                //         icon: Icon(Icons.menu),
                //         // color: Colors.grey[800],  light mode
                //         color: Colors.grey[350],

                //       ),
                SizedBox(height: 30,),
                
                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                          
                      // IconButton(
                      //   onPressed: null,
                      //   icon: Icon(Icons.menu),
                      //   // color: Colors.grey[800],  light mode
                      //   color: Colors.grey[350],

                      // ),
                    

                    new Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                         Container(  
                      //  padding: EdgeInsets.all(5),
                    //  margin: EdgeInsets.only(right: 10),
                     child: SizedBox(
                      width: 40,
                      height: 40,
                      child: Container(
                        decoration: BoxDecoration(
                       
                      //  color: Colors.yellow,
                       borderRadius: BorderRadius.circular(50),

                     ),
                     child: IconButton(
                      //  ************ call setting widget
                       onPressed: () {},
                       icon: Icon(
                         Icons.search,                    
                          // color: Colors.grey[800], light mode
                          color: Colors.grey[350],
                          
                         size: 20,                         
                       ),
                     ),
                      ),
                     
                   ),   
                    ),

                     Container(
                     padding: EdgeInsets.all(5),
                    //  margin: EdgeInsets.only(right: 10),
                     child: SizedBox(
                      width: 40,
                      height: 40,
                      child: Container(
                        decoration: BoxDecoration(
                       
                      //  color: Colors.yellow,
                       borderRadius: BorderRadius.circular(50),

                     ),
                     child: IconButton(
                      //  ************ call setting widget
                       onPressed: () {},
                       icon: Icon(
                         Icons.settings,                    
                          // color: Colors.grey[800], light mode
                          color: Colors.grey[350],

                          
                         size: 20,                         
                       ),
                     ),
                      ),
                     
                   ),   
                    ),
                      ],
                    ),
                      
                    
                   
                      //   ],
                      // ),
                    
                    
                   
                    //search && setting...
                    // SearchDelegate(searchFieldLabel: '', )

                      
                    
                                  
                  ],
                ),
                SizedBox(height: 10,),
                SingleChildScrollView(
                  // *************categoris 
                  scrollDirection: Axis.horizontal,
                  child: new Row(
                  children: [      
                    Padding(padding: EdgeInsets.all(10)),
                                

                      new Container(
                        child: SizedBox(
                          width: 70,
                          height: 30,
                          child: Container(
                            margin: EdgeInsets.only(right: 5),
                            decoration: BoxDecoration(                          
                              color: Colors.yellow[500],
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            child: new FlatButton(
                              onPressed: () {},
                              child: new Text(
                                "All",
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),                
                            ),
                          ),
                         ),
                      ),
                       
                      new Container(
                        child: SizedBox(
                          width: 75,
                          height: 30,
                          child: Container(
                            margin: EdgeInsets.only(right: 5),
                            decoration: BoxDecoration(                          
                              color: Colors.yellow[400],
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            child: new FlatButton(
                              onPressed: () {},
                              child: new Text(
                                "Jobs",
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),                
                            ),
                          ),
                         ),
                      ),

                      new Container(
                        child: SizedBox(
                          width: 80,
                          height: 30,
                          child: Container(
                            margin: EdgeInsets.only(right: 5),
                            decoration: BoxDecoration(                          
                              color: Colors.yellow[300],
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            child: new FlatButton(
                              onPressed: () {},
                              child: new Text(
                                "News",
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),                
                            ),
                          ),
                         ),
                      ),

                      new Container(
                        child: SizedBox(
                          width: 100,
                          height: 30,
                          child: Container(
                            margin: EdgeInsets.only(right: 5),
                            decoration: BoxDecoration(                          
                              color: Colors.yellow[200],
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            child: new FlatButton(
                              onPressed: () {},
                              child: new Text(
                                "Courses",
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),                
                            ),
                          ),
                         ),
                      ),                     
                    ],
                  ),
                ),
              Expanded(
                child: 
                SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: new Column(
                      children: [
                        // All(),
                      ],
                    ),
                ),    
              ),
              ],
            ),
         ),
         drawer: Drawer(
        child: Container(
          // child: Column(
            // children: [
              // icon: Icons.menu,
              child: Menu(),
            // ],
          // ),
        ),
      ),
      
        // new SingleChildScrollView(
        // child:
      //Search Done....
      //Categories Done....
      //posts from APIs on cards
      //flat add icon
    );
  }
}

