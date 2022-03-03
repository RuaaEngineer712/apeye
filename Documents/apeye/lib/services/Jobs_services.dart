import 'dart:convert';

import 'package:apeye/API/model/Jobs.dart';
import 'package:apeye/API/model/Jobs_model.dart';

import 'package:http/http.dart' as http;

class Jobs_services{
  final String key = 'd6f8838c0f6441b0a0cbaeda4274a7d7';
  Future<List<Jobs>> fetchJobs() async{    
    try{
      var jobUrl  = Uri.parse('https://customsearch.googleapis.com/customsearch/v1?cx=931e438f39f6499c6&exactTerms=engineer&sort=date&key=AIzaSyCC9TrOYMA6FKhBrd57u113aRIfoy2iDEQ');
      
      http.Response response = await http.get(jobUrl);
      if(response.statusCode == 200){
        
        String data = response.body;
        var jsonData = jsonDecode(data);
        
        Jobs_model jobs = Jobs_model.fromJson(jsonData);
        List<Jobs> jobs_list = jobs.jobs_model.map((e) => Jobs.fromJson(e)).toList();
        // print(news_list);
        return jobs_list;
      
      }
      else{
         print(response.statusCode);
         throw(response.statusCode);
         
      }
    }
    catch(e){
      print(e.toString());
      throw(e.toString());
    }
  }

}

// class Jobs_services_Management{
//   final String key = 'd6f8838c0f6441b0a0cbaeda4274a7d7';
//   Future<List<Jobs>> fetchJobs() async{    
//     try{
//       var jobUrlManagement  = Uri.parse('https://customsearch.googleapis.com/customsearch/v1?cx=d92410715fcd6d4d8&exactTerms=management&sort=date&key=AIzaSyCC9TrOYMA6FKhBrd57u113aRIfoy2iDEQ');
      
//       http.Response response_management = await http.get(jobUrlManagement);
//       if(response_management.statusCode == 200){
        
//         String data = response_management.body;
//         var jsonData = jsonDecode(data);
        
//         Jobs_model jobs = Jobs_model.fromJson(jsonData);
//         List<Jobs> jobs_list = jobs.jobs_model.map((e) => Jobs.fromJson(e)).toList();
//         // print(news_list);
//         return jobs_list;
      
//       }
//       else{
//          throw(response_management.statusCode);
//       }
//     }
//     catch(e){
//       throw(e.toString());
//     }
//   }

// }