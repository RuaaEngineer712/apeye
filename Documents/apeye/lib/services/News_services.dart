import 'dart:convert';

import 'package:apeye/API/model/News.dart';
import 'package:apeye/API/model/News_model.dart';

import 'package:http/http.dart' as http;

class News_services{
  final String key = 'd6f8838c0f6441b0a0cbaeda4274a7d7';
  Future<List<News>> fetchNews(List interests) async{    
    try{
      var url;
          List<News> allData = [];
          print("**************#######&&&&&&&&");
            print(interests);
          for(String interest in interests) {
          
            url  = Uri.parse('https://newsapi.org/v2/top-headlines?country=us&category=${interest}&apiKey=d6f8838c0f6441b0a0cbaeda4274a7d7');
            
            // var url_sport  = Uri.parse('https://newsapi.org/v2/top-headlines?country=us&category=sport&apiKey=d6f8838c0f6441b0a0cbaeda4274a7d7');
            
            http.Response response = await http.get(url);
            List<News> news_list = [];
            if(response.statusCode == 200){
              
              String data = response.body;
              var jsonData = jsonDecode(data);
              
              News_model news = News_model.fromJson(jsonData);
              news_list = news.news_model.map((e) => News.fromJson(e)).toList();
              allData = [...allData , ...news_list];
              // print(news_list);
              
            
            }
            else{
              throw(response.statusCode);
            }
          }
          
        

    }
    catch(e){
      throw(e.toString());
    }
    return [];
    
  }
  

  // Future<bool> fetchOrNot async(List<News_model> news_list){
  //   try{
  //     fetchNews();
  //     if(response.statusCode == 200)
  //   }
  //   catch(e){

  //   }
  // }

}