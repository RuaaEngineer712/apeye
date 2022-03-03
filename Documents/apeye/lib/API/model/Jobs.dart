import 'package:googleapis/people/v1.dart';

class Jobs {
  // final String name;
  final String title;
  final String link;
  final String snippet;
  // final String src;
  // final String date;

  

  Jobs({required this.title, required this.link, required this.snippet});

  factory Jobs.fromJson(Map<String, dynamic> jsonData){
    print(jsonData);
    print("\n");
    print("\n");
    print("\n");
    print("\n");
    print("\n");
    return Jobs(
      // name: jsonData['name']!= null ? jsonData['name'] : 'name',
      title: jsonData['title'],
      link: jsonData['link'] ,
      snippet: jsonData['snippet'],
      // src: jsonData['src']!= null ? jsonData['src'] : 'assets/images/new.png',
      // articleUrl: jsonData['url'],
      // date: jsonData['publishedAt'],
    );
  }

}