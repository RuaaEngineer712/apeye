import 'dart:convert';

import 'package:apeye/API/model/News.dart';
import 'package:apeye/API/model/News_model.dart';

import 'package:http/http.dart' as http;

class News_services{
  final String key = 'd6f8838c0f6441b0a0cbaeda4274a7d7';
  Future<List<News>> fetchNews() async{    
    try{
      var url  = Uri.parse('https://newsapi.org/v2/top-headlines?country=us&apiKey=$key');
      http.Response response = await http.get(url);
      if(response.statusCode == 200){
        
        String data = response.body;
        var jsonData = jsonDecode(data);
        
        News_model news = News_model.fromJson(jsonData);
        List<News> news_list = news.news_model.map((e) => News.fromJson(e)).toList();
        // print(news_list);
        return news_list;
      
      }
      else{
         throw(response.statusCode);
      }
    }
    catch(e){
      throw(e.toString());
    }
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