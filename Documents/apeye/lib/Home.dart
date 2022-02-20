import 'package:flutter/material.dart';
import 'All.dart';



class Home extends StatelessWidget {    
  String email;
      Home(this.email);
      

  @override
  Widget build(BuildContext context) {    
    return Scaffold(
      
      body:
         new Container(
            //row one
            
            child: new Column(
            
              children: [
                SizedBox(height: 20,),
                new Row(
                  
                  //****************row1
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Padding(padding: EdgeInsets.only(top: 50)),
                    // App Name ..
                    new Text(
                    
                    "APEye",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[800], 
                      ),
                    ),
                    
                    new Row(
                      
                      children: [
                        //Notification && dots
                        
                        Icon(Icons.person, color: Colors.grey[700], size: 30),
                        SizedBox(width: 10,),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 30,),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Padding(padding: EdgeInsets.all(2)),
                    //search && setting...
                    // SearchDelegate(searchFieldLabel: '', )
                     Container(
                      
                      height: 40,
                      width: 250,
                      child: TextFormField( 
                        
                        onChanged: (value) => email = value,             
                      decoration: InputDecoration(
                        
                        filled: true,
                        // icon: Icon(Icons.search),                    
                        hintText: "Search...",
                        enabledBorder: OutlineInputBorder(
                          // borderSide: BorderSide(color: Colors.grey),                       
                          borderRadius: BorderRadius.circular(5),                       
                        ),
                      ),                    
                    ),
                     ),
                    //  Container(
                    //    padding: EdgeInsets.all(5),
                    //    margin: EdgeInsets.only(right: 10),
                    //    decoration: BoxDecoration(
                    //      color: Colors.yellow,
                    //      borderRadius: BorderRadius.circular(50),
                    //    ),
                    //    child:
                    Icon(Icons.settings, color: Colors.grey[800], size: 30,),
                    //  ), 
                     
                  ],
                ),
                SizedBox(height: 30,),
                SingleChildScrollView(
                  // *************categoris 
                  scrollDirection: Axis.horizontal,
                  child: new Row(
                  children: [      
                    Padding(padding: EdgeInsets.all(5)),            
                    new Card(
                      color: Colors.yellow[600],
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(200.0)),
                      child: new FlatButton(
                        minWidth: 85,
                        height: 25,
                        onPressed: null,
                        child: new Text(
                          "All",
                          style: TextStyle(
                            color: Colors.grey[800],
                          ),
                        ),
                          
                      ),
                    ),

                    new Card(
                      color: Colors.yellow[400],
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(200.0)),
                      child: new FlatButton(
                        minWidth: 85,
                        height: 25,
                        onPressed: null,
                        child: new Text(
                          "Jobs",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                          
                      ),
                    ),

                    new Card(
                      color: Colors.yellow[300],
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(200.0)),
                      child: new FlatButton(
                        minWidth: 85,
                        height: 25,
                        onPressed: null,
                        child: new Text(
                          "News",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                          
                      ),
                    ),

                    new Card(
                      color: Colors.yellow[100],
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(200.0)),
                      child: new FlatButton(
                        minWidth: 85,
                        height: 25,
                        onPressed: null,
                        child: new Text(
                          "Courses",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                          
                      ),
                    ),
                  ],
                ),
                ),
                // SingleChildScrollView(
                  //**********posts */
                  // scrollDirection: Axis.horizontal,
                  
                  //  new Column(
                  //   children: [
                      //posts
                      All(),
                    // ],
                  // ),
                 
              
            // ),
              ],
          ),
          
          
        

        // new SingleChildScrollView(
        // child:
          
    
         ),
      //Search
      //Categories
      //posts from APIs on cards
      //flat add icon
    );
  }
}

