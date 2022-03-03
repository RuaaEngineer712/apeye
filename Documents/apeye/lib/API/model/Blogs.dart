import 'package:googleapis/people/v1.dart';

class Blogs {
  // final String name;
  final String title;
  final String published;
  final String content;
  final String url;

  

  Blogs({required this.title, required this.published, required this.content, required this.url});

  factory Blogs.fromJson(Map<String, dynamic> jsonData){
    print(jsonData);
    print("\n");
    print("\n");
    print("\n");
    print("\n");
    print("\n");
    return Blogs(
      // name: jsonData['name']!= null ? jsonData['name'] : 'name',
      title: jsonData['title'],
      published: jsonData['published'] ,
      content: jsonData['content'],
      url: jsonData['url'],
    );
  }

}