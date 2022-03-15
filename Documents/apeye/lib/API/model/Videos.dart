import 'package:googleapis/people/v1.dart';

  
class Vedios {
  // final String name;
  final String title;
  final String url;
  final String thumbnails;
  final String author;
  // final String descriptionShort;

  

  // Vedios({required this.title, required this.url});
  Vedios({required this.title, required this.url, required this.thumbnails, required this.author});

  factory Vedios.fromJson(Map<String, dynamic> jsonData){
    print(jsonData);
    print("\n");
    print("\n");
    print("\n");
    print("\n");
    print("\n");
    return Vedios(
      // name: jsonData['name']!= null ? jsonData['name'] : 'name',
      title: jsonData['title'] != null ? jsonData['title'] : '',
      url: jsonData['url'] != null ? jsonData['url'] : 'url',
      author: jsonData['author']['name'] != null ? jsonData['author']['name'] : '',
      thumbnails: jsonData['bestThumbnail']['url'] != null ? jsonData['bestThumbnail']['url'] : '',
      // descriptionShort: jsonData['descriptionShort'] != null ? jsonData['descriptionShort'] : '',
    );
  }
}