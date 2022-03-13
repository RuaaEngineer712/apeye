import 'dart:convert';

import 'package:apeye/API/model/Books.dart';
import 'package:apeye/API/model/Books_model.dart';

import 'package:http/http.dart' as http;

class teetBooks_services {
  // final String key = 'd6f8838c0f6441b0a0cbaeda4274a7d7';
  Future<List<Books>> fetchBooks(List interests) async {
    try {
      var url;
      List<Books> allData = [];
      
      // print(interests);
      for (String interest in interests) {
        print(interest);
        url = Uri.parse(
            'https://www.googleapis.com/books/v1/volumes?q=${interest}');
        
        
        http.Response response = await http.get(url);
        List<Books> books_list = [];
        if (response.statusCode == 200) {

          String data = response.body;
          var jsonData = jsonDecode(data);

          Books_model books = Books_model.fromJson(jsonData);
          // print("**************#######&&&&&&&&");
          
          books_list = books.books_model.map((e) => (Books.fromJson(e))
            ).toList();
          print(books_list);

          allData = [...allData, ...books_list];
      


          if(allData.isNotEmpty){

          } else {
            return [];
          }
          // print(news_list);

        } else {
          throw (response.statusCode);
        }
      }
      return allData;
    } catch (e) {
      return [];
    }
    return [];
  }
}