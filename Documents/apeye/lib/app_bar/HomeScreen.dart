
import 'package:apeye/view_models/APIs/news_view_model.dart';
import 'package:provider/provider.dart';

import 'drawerScreen.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../All.dart';
import 'configuration.dart';


class HomeScreen extends StatefulWidget {
  String email;
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
  @override

    Widget build(BuildContext context) {
    final text = MediaQuery.of(context).platformBrightness == Brightness.dark ? 'DarkTheme' : 'LightTheme';
    return 
    ChangeNotifierProvider<News_view_model>(
      create: (context) => News_view_model(),
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
                                child:Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image.asset(categories[index]['iconPath'],
                                    height: 30,
                                    width: 50,),
                                    Text(categories[index]['name']),
                                  ],
                                ), 
                              ),
                            ],
                          ),
                        );
                      }
                    ),
                  ),
                  // for (var i = 0; i < 10; i++) (
                  // ChangeNotifierProvider<News_view_mode>(
                  //   create: (_) => News_view_mode(),
                    All(),
                  //   )
                  // ),            
                ],
              ),
            ),
          ),
        ],
      ),
    )
    );
  }
}
