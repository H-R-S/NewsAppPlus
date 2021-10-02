class ArticaleModel {
  final String author;
  final String title;
  final String description;
  final String url;
  final String image;
  final String date;
  final String content;

  ArticaleModel(this.author, this.title, this.description, this.url, this.image,
      this.date, this.content);

  ArticaleModel.fromJson(Map<String, dynamic> json)
      : author = json["author"],
        title = json["title"],
        description = json["description"],
        url = json["url"],
        image = json["urlToImage"],
        date = json["publishedAt"],
        content = json["content"];
}
