import 'package:flutter/material.dart';

class Some extends StatefulWidget {    
  @override
  State<StatefulWidget> createState() {
    return new _SomeThing();
  }
}


class _SomeThing extends State<Some>{

  String text = "";
  String text1 = "";
  String text2 = ""; 

  void onSearch(){
    setState(() {
      text = "search";
    });
  }

  void onNotifi(){
    setState(() {
      text = "notification";
    });
  }

  void onChangeMail(String mail){
    setState(() {
      text1 = "$mail";
    });
  }

  void onChangePass(String pass){
    setState(() {
      text2 = "$pass";
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      // backgroundColor: Colors.deepPurple,
      appBar: new AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        foregroundColor: Colors.amber,
        title: new Text("Login"),
        actions: [
          IconButton(onPressed: ()=> onSearch(), icon: Icon(Icons.search)),
          IconButton(onPressed: ()=> onSearch(), icon:  Icon(Icons.notifications)),
        ],
      ),
      body: new Container(
        padding: new EdgeInsets.all(33.0),
        child:new Column(
           mainAxisAlignment: MainAxisAlignment.center,
          children: [

            new Text("This is your changed in mail: $text1"),
            new Text("This is your changed in pass: $text2"),

            new TextField(
              autofocus: true,
              keyboardType: TextInputType.emailAddress,
              onChanged: onChangeMail,
              decoration: new InputDecoration(
              icon: Icon(Icons.person),
              labelText: "your email",
              hintText: "email",
              
            ),
          ),
          
            new Text("\n\n\n "),

            new TextField(
              autofocus: true,
              onChanged: onChangePass,
              decoration: new InputDecoration(
                icon: Icon(Icons.enhanced_encryption_sharp),
                labelText: "your password",
                hintText: "password",
              ),  
            ),
            new FlatButton(onPressed: () {Navigator.of(context).pushNamed("/InformOne");}, child: new Text("first")),
            new FlatButton(onPressed: () {Navigator.of(context).pushNamed("/InformTwo");}, child: new Text("second")),
        ],
      ),
      ),
      
      bottomNavigationBar: new BottomNavigationBar(items: [
        new BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home", backgroundColor: Colors.yellow),
        new BottomNavigationBarItem(icon: Icon(Icons.settings),label: "Setting"),
        new BottomNavigationBarItem(icon: Icon(Icons.save), label: "Saved post"),
      ]),

    );
  }

}