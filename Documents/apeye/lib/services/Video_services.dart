import 'dart:convert';

import 'package:apeye/API/model/Videos.dart';
import 'package:apeye/API/model/Videos_model.dart';

import 'package:http/http.dart' as http;

class Video_services {
  static const _api_key = "06cd474b17mshd78dae40c40d880p131192jsn68d40042bb96";
  static const String _baseUrl = "youtube-search-results.p.rapidapi.com";
  static const Map<String, String> _headers = {
    "content-type": "application/json",
    "x-rapidapi-host": "youtube-search-results.p.rapidapi.com",
    "x-rapidapi-key": _api_key,
  };
  Future<List<Vedios>> fetchVedios({
    required Map<String, String> query,
  }) async {
    
    Uri uri = Uri.https(_baseUrl, "/youtube-search/" , query);
    print(_baseUrl);
    http.Response response = await http.get(uri, headers: _headers);
    if (response.statusCode == 200) {
      String data = response.body;
      var jsonData = jsonDecode(data);

      Videos_model vedios = Videos_model.fromJson(jsonData);
      List<Vedios> vedios_list =
          vedios.videos_model.map((e) => Vedios.fromJson(e)).toList();
          print("*********************in service");
      return vedios_list;
    } else {
      print(response.statusCode);
      throw (response.statusCode);
    }
  }
}