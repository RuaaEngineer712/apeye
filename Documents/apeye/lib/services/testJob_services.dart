import 'dart:convert';

import 'package:apeye/API/model/Jobs.dart';
import 'package:apeye/API/model/Jobs_model.dart';

import 'package:http/http.dart' as http;

class testJob_services {
  final String key = 'd6f8838c0f6441b0a0cbaeda4274a7d7';
  Future<List<Jobs>> fetchJobs(List interests) async {
    try {
      var url;
      List<Jobs> allData = [];
      print("**************#######&&&&&&&&");
      // print(interests);
      for (String interest in interests) {
        print(interest);
        url = Uri.parse(
            'https://customsearch.googleapis.com/customsearch/v1?cx=931e438f39f6499c6&exactTerms=${interest}&sort=date&key=AIzaSyA0P0AaI20OKT8-Hs751jCuZCXSqZcbAvs');

        http.Response response = await http.get(url);
        List<Jobs> jobs_list = [];
        if (response.statusCode == 200) {
          String data = response.body;
          var jsonData = jsonDecode(data);

          Jobs_model jobs = Jobs_model.fromJson(jsonData);
          jobs_list = jobs.jobs_model.map((e) => Jobs.fromJson(e)).toList();
          allData = [...allData, ...jobs_list];
          if(allData.isNotEmpty){
          return allData;
          } else {
            return [];
          }
          // print(news_list);

        } else {
          throw (response.statusCode);
        }
      }
    } catch (e) {
      return [];
    }
    return [];
  }
}