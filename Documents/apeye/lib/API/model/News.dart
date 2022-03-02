import 'package:googleapis/people/v1.dart';

class News {
  final String name;
  final String title;
  final String description;
  final String imageUrl;
  final String articleUrl;
  final String date;

  

  News({ required this.name, required this.title, required this.description, required this.imageUrl, required this.articleUrl, required this.date});

  factory News.fromJson(Map<String, dynamic> jsonData){
    print(jsonData);
    print("\n");
    print("\n");
    print("\n");
    print("\n");
    print("\n");
    return News(
      name: jsonData['name']!= null ? jsonData['name'] : 'name',
      title: jsonData['title'],
      description: jsonData['description'] != null ? jsonData['description'] : 'description',
      imageUrl: jsonData['urlToImage'] != null ? jsonData['urlToImage'] : '',
      articleUrl: jsonData['url'],
      date: jsonData['publishedAt'],
    );
  }

}