import 'dart:convert';

import '/testNews.dart';
import 'package:apeye/API/model/News_model.dart';

import 'package:http/http.dart' as http;

class News_services {
  static const _api_key = "4cf703aaa3msh01970ce058042bap1c558ejsn8016b00c5c93";
  static const String _baseUrl = "google-news.p.rapidapi.com";
  static const Map<String, String> _headers = {
    "content-type": "application/json",
    "x-rapidapi-host": "google-news.p.rapidapi.com",
    "x-rapidapi-key": _api_key,
  };
  Future<List<News_test>> fetchNews({
    required Map<String, String> query,
  }) async {
    
    Uri uri = Uri.https(_baseUrl, "/search" , query);
    print(_baseUrl);
    http.Response response = await http.get(uri, headers: _headers);
    if (response.statusCode == 200) {
      String data = response.body;
      var jsonData = jsonDecode(data);

      News_model news = News_model.fromJson(jsonData);
      List<News_test> news_list =
          news.news_model.map((e) => News_test.fromJson(e)).toList();
      return news_list;
    } else {
      // throw Exception('Failed to load json data');
      print(response.statusCode);
      throw (response.statusCode);
    }
  }
}




// import 'dart:convert';

// import 'package:apeye/API/model/News.dart';
// import 'package:apeye/API/model/News_model.dart';

// import 'package:http/http.dart' as http;

// class News_services{
//   final String key = 'd6f8838c0f6441b0a0cbaeda4274a7d7';
//   // final String urlBook = "https://openlibrary.org/search/subjects?q=${interest}";
//   Future<List<News>> fetchNews(List interests) async{    
//     try{
//       var url;
//           List<News> allData = [];
//           print("**************#######&&&&&&&&");
//             print(interests);
//           for(String interest in interests) {
          
//             url  = Uri.parse('https://newsapi.org/v2/top-headlines?country=in&category=${interest}&apiKey=d6f8838c0f6441b0a0cbaeda4274a7d7');
                    
//             http.Response response = await http.get(url);
//             List<News> news_list = [];
//             if(response.statusCode == 200){
              
//               String data = response.body;
//               var jsonData = jsonDecode(data);
              
//               News_model news = News_model.fromJson(jsonData);
//               news_list = news.news_model.map((e) => News.fromJson(e)).toList();
//               allData = [...allData , ...news_list];
//               // print(news_list);
              
            
//             }
//             else{
//               throw(response.statusCode);
//             }
//           }
          
        

//     }
//     catch(e){
//       throw(e.toString());
//     }
//     return [];
    
//   }

// }