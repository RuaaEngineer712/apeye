import 'package:flutter/material.dart';

void main(){
  runApp(
    new MaterialApp(
      home: Home(),
      title: "title",
    )
  );
}

class Home extends StatelessWidget {    @override
  
@override
  Widget build(BuildContext context) {
      return Material(
        child: new Scaffold(
          appBar: new AppBar(
            title: new Text("Noon"),
            backgroundColor: Colors.black12,
            actions: [
              new IconButton(onPressed: null, icon: new Icon(Icons.alarm)),
              new IconButton(onPressed: null, icon: new Icon(Icons.search)),
            ],
          ),

          bottomNavigationBar: new BottomNavigationBar(items: [
            
            new BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home"),
            
            new BottomNavigationBarItem(
              icon: Icon(Icons.save),
              label: "Saved Post")
          
          
          ]),
         floatingActionButton: new FloatingActionButton(
           onPressed: null,
           backgroundColor: Colors.pink,),
        )
      );
  }
}


  































// import 'package:flutter/material.dart';

// void main(){
//   runApp(
//     new MaterialApp(
//       home:Method(),
//       title:"Title",
//     )
//   );
// }

// class Method extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//       return new Material(
//         color: Colors.purple,
//         child: new Scaffold(
//           appBar: new AppBar(
//             backgroundColor: Colors.pinkAccent,
//             title: new Text("Ruaa"),
//             actions: [
//               new IconButton(onPressed: null, icon: new Icon(Icons.search)),
//               new IconButton(onPressed: null,icon: new Icon(Icons.notifications)),
//             ],
//           ),
//           bottomNavigationBar: new BottomNavigationBar(items: [
//             new BottomNavigationBarItem(icon: new Icon(Icons.home),
//             label:("Home")),
//             new BottomNavigationBarItem(icon: new Icon(Icons.save),
//             label:("Saved post")),
//           ],
//           onTap: (int x) => debugPrint('index $x'),
//           ),
//           floatingActionButton: new FloatingActionButton(
//             onPressed: null,
//             backgroundColor: Colors.yellow,
//             child: new Icon(Icons.add),
//           ),
//           )
//       );
//   }
  
// }