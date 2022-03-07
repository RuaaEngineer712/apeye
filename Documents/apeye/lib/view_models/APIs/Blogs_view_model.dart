import 'package:apeye/API/model/Blogs.dart';
import 'package:apeye/services/Blogs_services.dart';
import 'package:flutter/cupertino.dart';

class Blogs_view_model extends ChangeNotifier{
  List<Blogs> _blogsList = [];


   Future<void> fetchBlogs() async {
    _blogsList = await Blogs_services().fetchBlogs();
    notifyListeners();  
  }

  List<Blogs> get blogsList => _blogsList;
}