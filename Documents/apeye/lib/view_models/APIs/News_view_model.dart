import '/testNews.dart';
import '/News_services.dart';
import 'package:flutter/cupertino.dart';

class News_view_model extends ChangeNotifier {
  List<News_test> _newsList = [];
  
  Future<void> fetchNews(List interests) async {
    // for(String interest in interests)
    _newsList = await News_services().fetchNews(
      query: {
        "q": '${interests}', "country": 'US', "lang": 'en', "when": '${interests}'
      },
    );

    print(_newsList);
    notifyListeners();
  }

  List<News_test> get newsList => _newsList;
}
