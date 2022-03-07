import 'package:apeye/view_models/APIs/Blogs_view_model.dart';
import 'package:apeye/view_models/APIs/Jobs_view_model.dart';
import 'package:apeye/view_models/APIs/news_view_model.dart';
import 'package:googleapis/servicemanagement/v1.dart';
import 'package:provider/provider.dart';

import 'drawerScreen.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../All.dart';
import '../Jobs_ui.dart';
import '../Blogs_ui.dart';

import 'configuration.dart';


class HomeScreen extends StatefulWidget {
  String email;
  // HomeScreen(this.email, this.interest);
  HomeScreen(this.email);
  
  @override
  _HomeScreenState createState() => _HomeScreenState(email);
}

class _HomeScreenState extends State<HomeScreen> {

  

  String email;
  _HomeScreenState(this.email);

  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;

  bool isDrawerOpen = false;
  bool clicked_news= false;
  bool clicked_job= false;
  bool clicked_blogs= false;


  Future<void> _refresh(){
    return Future.delayed(
      Duration(seconds: 0)
    );
  }

  @override
    Widget build(BuildContext context) {
    final text = MediaQuery.of(context).platformBrightness == Brightness.dark ? 'DarkTheme' : 'LightTheme';
    String element = '';
    return RefreshIndicator(
        edgeOffset: 0,
        onRefresh: _refresh,
        child: Scaffold(
          backgroundColor: Colors.blueGrey, 
          body: Stack(
            children: [
              DrawerScreen(email),
              AnimatedContainer(
            transform: Matrix4.translationValues(xOffset, yOffset, 0)
              ..scale(scaleFactor)..rotateY(isDrawerOpen? -0.5:0),
                duration: Duration(milliseconds: 250),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(isDrawerOpen?40:0.0)
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            isDrawerOpen?IconButton(
                              icon: Icon(Icons.arrow_back_ios),
                              onPressed: (){
                                setState(() {
                                  xOffset=0;
                                  yOffset=0;
                                  scaleFactor=1;
                                  isDrawerOpen=false;
                                });
                              },
                            ): IconButton(
                              icon: Icon(Icons.menu),
                              onPressed: () {
                                setState(() {
                                  xOffset = 230;
                                  yOffset = 150;
                                  scaleFactor = 0.6;
                                  isDrawerOpen=true;
                                });
                              }),
                              Column(
                                children: [
                                  Text(
                                    'APeye',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text('Your interest'), 
                                ],
                              ),
                              CircleAvatar()
                            ],
                          ),
                        ),
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
                              Text('Search...'),
                              // Icon(Icons.settings)
                            ],
                          ),
                        ),
                        Container(height: 80,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: categories.length,
                          itemBuilder: (context,index){
                            return Container(
                              child: new Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(right: 10, top: 10, bottom: 10),
                                    margin: EdgeInsets.only(left: 30),
                                    decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      boxShadow: shadowList,
                                      borderRadius: BorderRadius.circular(10)
                                    ),
                                    child: InkWell(
                                      child:Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Image.asset(categories[index]['iconPath'],
                                          height: 30,
                                          width: 50,),
                                          Text(categories[index]['name']),
                                        ],
                                      ),
                                      onTap:() => {
                                        element = categories[index]['name'].toString(),
                                        if(element == "News"){
                                          print(element),
                                          setState(() {
                                            clicked_news = true;
                                            clicked_job = false;
                                            clicked_blogs = false;
                                          })
                                        }
                                        else if(element == "Jobs"){
                                           print(element),
                                          setState(() {
                                            clicked_job = true;
                                            clicked_news = false;
                                            clicked_blogs = false;
                                          })
                                        }
                                        else if(element == "Blogs"){
                                           print(element),
                                          setState(() {
                                            clicked_job = false;
                                            clicked_news = false;
                                            clicked_blogs = true;
                                          })
                                        }
                                        
                                          // new Container(
                                            // child: All(),
                                          // ),
                                        }
                                      // }
                                    ), 
                                  ),
                                ],
                              ),
                            );
                          }
                        ),
                      ),
                      // MultiProvider(
                      //   providers: [                        
                          
                          

                            Visibility(
                              visible: clicked_job,
                            child: ChangeNotifierProvider<Jobs_view_model>(
                            create: (context) => Jobs_view_model(),
                            builder: (context, child) => Jobs_ui(email), 
                            ),
                          ),         
                          
                             Visibility(
                              visible: clicked_news,
                              child: ChangeNotifierProvider<News_view_model>(
                            create: (context) => News_view_model(),
                            builder: (context, child) => All(email), 
                            ),
                          ),

                          Visibility(
                              visible: clicked_blogs,
                              child: ChangeNotifierProvider<Blogs_view_model>(
                            create: (context) => Blogs_view_model(),
                            builder: (context, child) => Blogs_ui(email), 
                            ),
                          ),
                      //   ],
                      // ),
                // ),
              // ),
            ],
          ),
        ),
      // ),
      // }
    //       ),
        
    //   ),
    //   ],
      
    ),
      ],
              ),
              ),
    );
  }
}

class DataSearch extends SearchDelegate<String>{
  Future<void> newslist = new News_view_model().fetchNews();
  

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [IconButton(onPressed: (){}, icon: Icon(Icons.clear))];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: (){},
       icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty? newslist : newslist;
    return ListView(
      children: [
        // Text(suggestionList),
      ],
    );
  }
}
