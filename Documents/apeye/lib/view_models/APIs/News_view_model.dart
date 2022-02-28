import 'package:apeye/API/model/News.dart';
import 'package:apeye/services/News_services.dart';
import 'package:flutter/cupertino.dart';

class News_view_model extends ChangeNotifier{
  List<News> _newsList = [];

   Future<void> fetchNews() async {
    _newsList = await News_services().fetchNews();
    notifyListeners();  
  }

  List<News> get newsList => _newsList;
}