class News {

  final String title;
  final String description;
  final String imageUrl;
  final String articleUrl;
  final String date;

  News({required this.title, required this.description, required this.imageUrl, required this.articleUrl, required this.date});

  factory News.fromJson(Map<String, dynamic> jsonData){
    print(jsonData);
    print("\n");
    print("\n");
    print("\n");
    print("\n");
    print("\n");
    return News(
      title: jsonData['title'],
      description: jsonData['description'],
      imageUrl: jsonData['urlToImage'] != null ? jsonData['urlToImage'] : '',
      articleUrl: jsonData['url'],
      date: jsonData['publishedAt'],
    );
  }

}