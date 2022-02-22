import 'package:flutter/material.dart';
import 'package:apeye/menu_item.dart';


class MenuItem {
  String menuVal;
  IconData iconVal;

  MenuItem(this.menuVal, this.iconVal);
}


final List<MenuItem> menuitems = [
   MenuItem('save', Icons.save),
    MenuItem('share', Icons.share), 
];







// MenuItem itemShare = MenuItem(
//     'Share',
//     Icons.save,
// );


//   static const List<MenuItem> itemFirst = [
//     itemSave,
//     itemShare,
//   ],

//   static const itemSave = MenuItem(
//     text: 'Save Post',
//     icon: Icons.save,
//   );

//   
// }



// class Save_Share extends StatelessWidget {    
//   @override
//   Widget build(BuildContext context) {
//     return Container (
      
//       height: 50,
//       width: 50,
//       color: Colors.black,
//       child: Column(
//         children: [
          
//           PopupMenuButton(itemBuilder: (BuildContext context))
//           FlatButton(
//             onPressed: (){},
//             child: new Text("Save post"),
//           ),
//           FlatButton(
//             onPressed: (){},
//             child: new Text("share post"),
//           ),
//         ],  
//       ),
//     );
//   }
// }
