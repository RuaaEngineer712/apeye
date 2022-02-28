

// // import 'dart:js';

// import 'package:apeye/API/model/News.dart';
// import 'package:apeye/API/model/load_data.dart';
// import 'package:apeye/All.dart';
// import 'package:apeye/app_bar/HomeScreen.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert' as convert;





// Future<void> getData(var interest, var category) async{
//   var url  = Uri.parse("https://www.googleapis.com/customsearch/v1?q={searchTerms}&num={count?}&start={startIndex?}&lr={language?}&safe={safe?}&cx={cx?}&sort={sort?}&filter={filter?}&gl={gl?}&cr={cr?}&googlehost={googleHost?}&c2coff={disableCnTwTranslation?}&hq={hq?}&hl={hl?}&siteSearch={siteSearch?}&siteSearchFilter={siteSearchFilter?}&exactTerms={exactTerms?}&excludeTerms={excludeTerms?}&linkSite={linkSite?}&orTerms={orTerms?}&relatedSite={relatedSite?}&dateRestrict={dateRestrict?}&lowRange={lowRange?}&highRange={highRange?}&searchType={searchType}&fileType={fileType?}&rights={rights?}&imgSize={imgSize?}&imgType={imgType?}&imgColorType={imgColorType?}&imgDominantColor={imgDominantColor?}&alt=json");
//   http.Response response = await http.get(url);

//   if(response.statusCode == 200){
//     String data = response.body;

//     var parsedJson = convert.jsonDecode(data);
//     var jobs = Jobs.fromJson(parsedJson);

//     print(jobs);

//     // Navigator.pushAndRemoveUntil(
//     //   context,
//     //   MaterialPageRoute(
//     //     builder: (context) => All(
//     //       Jobs: jobs,),
//     //     ),
//     //   (route) => false);
//   }
//   else{
//     print(response.statusCode);
//   }
// }
  
