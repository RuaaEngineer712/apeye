// import 'package:flutter/material.dart';

// class Book extends StatefulWidget{
//    @override
//   State<StatefulWidget> createState() {
//     // TODO: implement createState
//     throw UnimplementedError();
//   }
// }
// class Book_test extends State<Book> {
// String title, url;
//   Book_test(this.title, this.url);
// List<Book_test> _items = new List();
// final subject = new PublishSubject<String>();
// bool _isLoading = false;


//    @override
//   void initState() {
//     super.initState();
//     subject.stream.debounce(new Duration(milliseconds: 600)).listen(_textChanged);
//   }

//     @override
//   Widget build(BuildContext context) {
    
  
//     return new Column(
//       children: [
//          TextField(
//               decoration: new InputDecoration(
//                 hintText: 'Choose a book',
//               ),
//               onChanged: (string) => (subject.add(string)),
//     ),
//     new Expanded(
//               child: new ListView.builder(
//                 padding: new EdgeInsets.all(8.0),
//                 itemCount: _items.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   return new Card(
//                     child: new Padding(
//                         padding: new EdgeInsets.all(8.0),
//                         child: new Row(
//                           children: <Widget>[
//                             _items[index].url != null? new Image.network(_items[index].url): new Container(),
//                             new Flexible(
//                                 child: new Text(_items[index].title, maxLines: 10),
//                             ),
//                           ],
//                         )
//                     )
//                   );
//                 },
//               ),
//             ),
//       ],
    
    
//             );

            
//   }
//   void _textChanged(String text) {
//     if(text.isEmpty) {
//       setState((){_isLoading = false;});
//       _clearList();
//       return;
//     }
//     setState((){_isLoading = true;});
//     _clearList();
//     http.get("https://www.googleapis.com/books/v1/volumes?q=$text")
//         .then((response) => response.body)
//         .then(JSON.decode)
//         .then((map) => map["items"])
//         .then((list) {list.forEach(_addBook);})
//         .catchError(_onError)
//         .then((e){setState((){_isLoading = false;});});
//   }

//   void _onError(dynamic d) {
//     setState(() {
//       _isLoading = false;
//     });
//   }

//   void _clearList() {
//     setState(() {
//       _items.clear();
//     });
//   }
//   void _addBook(dynamic book) {
//     setState(() {
//       _items.add(new Book(book["volumeInfo"]["title"], book["volumeInfo"]["imageLinks"]["smallThumbnail"]));
//     });
//   }
// }







