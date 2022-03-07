import 'dart:convert';

import 'package:apeye/API/model/Blogs.dart';
import 'package:apeye/API/model/Blogs_model.dart';

import 'package:http/http.dart' as http;

class Blogs_services{
  final String key = 'd6f8838c0f6441b0a0cbaeda4274a7d7';
  Future<List<Blogs>> fetchBlogs() async{    
    try{
      var url  = Uri.parse('https://www.googleapis.com/blogger/v3/blogs/2399953/posts?key=A IzaSyCC9TrOYMA6FKhBrd57u113aRIfoy2iDEQ');
      
      http.Response response = await http.get(url);
      if(response.statusCode == 200){
        
        String data = response.body;
        var jsonData = jsonDecode(data);
        
        Blogs_model blogs = Blogs_model.fromJson(jsonData);
        List<Blogs> blogs_list = blogs.blogs_model.map((e) => Blogs.fromJson(e)).toList();
        // print(blogs_list);
        return blogs_list;
      
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