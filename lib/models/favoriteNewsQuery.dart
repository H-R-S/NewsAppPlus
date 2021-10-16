class FavoriteNewsQueryModel {
  late String userUid;
  late String newsHead;
  late String newsDes;
  late String newsImg;
  late String newsUrl;
  late bool newsFav;

  FavoriteNewsQueryModel(
      {this.userUid = "User Id",
      this.newsHead = "NEWS HEADLINE",
      this.newsDes = "SOME NEWS",
      this.newsImg = "SOME URL",
      this.newsUrl = "SOME URL",
      this.newsFav = true});

  factory FavoriteNewsQueryModel.fromMap(Map news) {
    return FavoriteNewsQueryModel(
        newsHead: news["title"],
        newsDes: news["description"],
        newsImg: news["urlToImage"],
        newsUrl: news["url"],
        newsFav: news[true]);
  }
}
