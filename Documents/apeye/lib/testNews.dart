import 'package:googleapis/people/v1.dart';

class News_test {
  // final String name;
  final String title;
  final String link;
  // final String snippet;
  // final String src;
  // final String date;

  News_test({required this.title, required this.link});

  factory News_test.fromJson(Map<String, dynamic> jsonData) {
    print(jsonData);
    print("\n");
    print("\n");
    print("\n");
    print("\n");
    print("\n");
    return News_test(
      title: jsonData['title'],
      link: jsonData['link'],
    );
  }
}
