
import 'package:first_project/Welcome.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:first_project/Inform.dart';
import 'package:first_project/Registration.dart';
import 'package:first_project/ui/Some.dart';
import 'package:flutter/material.dart';
import './bottons.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    new MaterialApp(
      home: Final_Login(),
    )
  );
}
 
class Go extends StatelessWidget {   
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Home",
      theme: ThemeData(
        primaryColor: Colors.yellow,
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
          headline2: TextStyle(fontSize: 22, color: Colors.black, fontWeight: FontWeight.bold),
          headline3: TextStyle(fontSize: 20, color: Colors.white),
          headline4: TextStyle(fontSize: 16),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(25),
          ),  
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(25),
          ), 
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(25),
          ),
        ),
      ),




      routes: <String, WidgetBuilder>{
        "/InformOne" : (BuildContext context) => new checkbox(),
        "InformTwo" : (BuildContext context) => new Inform(),
        "/Final_Login" : (BuildContext context) => new Final_Login(),
        "/Registration" : (BuildContext context) => new Registration(),
        "/Login" : (BuildContext context) => new Some(),
      },
      home: Final_Login(),
    );
  }
}



// import './page/filter_local_list_page.dart';
// import './page/filter_network_list_page.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// Future main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await SystemChrome.setPreferredOrientations([
//     DeviceOrientation.portraitUp,
//     DeviceOrientation.portraitDown,
//   ]);

//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   static final String title = 'Filter & Search ListView';

//   @override
//   Widget build(BuildContext context) => MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: title,
//         theme: ThemeData(primarySwatch: Colors.blue),
//         home: MainPage(),
//       );
// }

// class MainPage extends StatefulWidget {
//   @override
//   _MainPageState createState() => _MainPageState();
// }

// class _MainPageState extends State<MainPage> {
//   int index = 0;

//   @override
//   Widget build(BuildContext context) => Scaffold(
//         // bottomNavigationBar: buildBottomBar(),
//         body: buildPages(),
//       );

//   // Widget buildBottomBar() {
//   //   final style = TextStyle(color: Colors.white);

//   //   return BottomNavigationBar(
//   //     backgroundColor: Theme.of(context).primaryColor,
//   //     selectedItemColor: Colors.white,
//   //     unselectedItemColor: Colors.white70,
//   //     currentIndex: index,
//   //     items: [
//   //       BottomNavigationBarItem(
//   //         icon: Text('Filter List', style: style),
//   //         label:  'Local',
//   //       ),
//   //       // BottomNavigationBarItem(
//   //       //   icon: Text('Filter List', style: style),
//   //       //   label: "Network"
//   //       // ),
//   //   //   ],
//   //   //   onTap: (int index) => setState(() => this.index = index),
//   //   // );
//   // }

//   Widget buildPages() {
//     switch (index) {
//       case 0:
//         return FilterLocalListPage();
//       case 1:
//         return FilterNetworkListPage();
//       default:
//         return Container();
//     }
//   }
// }