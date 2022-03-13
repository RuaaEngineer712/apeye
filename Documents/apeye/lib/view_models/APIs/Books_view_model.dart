import 'package:apeye/API/model/Books.dart';
import 'package:apeye/services/tetsBook_services.dart';
import 'package:flutter/cupertino.dart';

class Books_view_model extends ChangeNotifier{
  List<Books> _booksList = [];

   Future<void> fetchBooks(List interests) async {
    _booksList = await teetBooks_services().fetchBooks(interests);
    print("89283208098094");print(_booksList.toString());

    notifyListeners();  
  }

  List<Books> get booksList => _booksList;
  
}