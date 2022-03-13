import 'package:googleapis/people/v1.dart';

class Books {
  final String title;
  final String subtitle;
  // final String authors;
  final String publishedDate;
  final String description;
  final String img;

  

  Books({required this.title, required this.subtitle, required this.publishedDate, required this.description, required this.img});

  factory Books.fromJson(Map<String, dynamic> jsonData){
    
    Map<String, dynamic> json = jsonData["volumeInfo"];
    
    print("\n");
    print("\n");
    print("\n");
    print("\n");
    return Books(
      // name: jsonData['name']!= null ? jsonData['name'] : 'name',
      title: json['title'],
      subtitle: json['subtitle'] != null ? json['subtitle'] : 'subtitle',
      // authors: jsonData['authors'] != null ? jsonData['authors'] : '',
      publishedDate: json['publishedDate'],
      description: json['description'] != null ? json['description'] : 'description',
      img: json['imageLinks']['thumbnail'] != null ? json['imageLinks']['thumbnail'] : '',
    );
  }

}