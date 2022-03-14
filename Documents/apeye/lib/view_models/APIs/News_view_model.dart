import '/testNews.dart';
import '/News_services.dart';
import 'package:flutter/cupertino.dart';

class News_view_model extends ChangeNotifier {
  List<News_test> _newsList = [];

  Future<void> fetchNews(List interests) async {
    _newsList = await News_services().fetchNews(
      query: {
        "q": 'Engineer', "country": 'US', "lang": 'en', "when": 'Engineer'
      },
    );

    print(_newsList);
    notifyListeners();
  }

  List<News_test> get newsList => _newsList;
}
