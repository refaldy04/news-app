import 'dart:developer';

class NewsModel {
  String? status;
  int? totalResults;
  List<Articles>? articles;
  String? nextPage;

  NewsModel({this.status, this.totalResults, this.articles, this.nextPage});

  NewsModel.fromJson(Map<String, dynamic> json) {
    log(json.toString());

    status = json['status'];
    totalResults = json['totalResults'];
    if (json['results'] != null) {
      articles = <Articles>[];
      json['results'].forEach((v) {
        articles!.add(Articles.fromJson(v));
      });
    }
    nextPage = json['nextPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = status;
    data['totalResults'] = totalResults;
    if (articles != null) {
      data['results'] = articles!.map((v) => v.toJson()).toList();
    }
    data['nextPage'] = nextPage;
    return data;
  }
}

class Articles {
  String? articleId;
  String? title;
  String? link;
  List<String>? keywords;
  List<String>? creator;
  Null? videoUrl;
  String? description;
  String? content;
  String? pubDate;
  String? imageUrl;
  String? sourceId;
  int? sourcePriority;
  List<String>? country;
  List<String>? category;
  String? language;

  Articles(
      {this.articleId,
      this.title,
      this.link,
      this.keywords,
      this.creator,
      this.videoUrl,
      this.description,
      this.content,
      this.pubDate,
      this.imageUrl,
      this.sourceId,
      this.sourcePriority,
      this.country,
      this.category,
      this.language});

  Articles.fromJson(Map<String, dynamic> json) {
    articleId = json['article_id'];
    title = json['title'];
    link = json['link'];
    // keywords = json['keywords'].cast<String>();
    // creator = json['creator'].cast<String>();
    videoUrl = json['video_url'];
    description = json['description'];
    content = json['content'];
    pubDate = json['pubDate'];
    imageUrl = json['image_url'];
    sourceId = json['source_id'];
    sourcePriority = json['source_priority'];
    country = json['country'].cast<String>();
    category = json['category'].cast<String>();
    language = json['language'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['article_id'] = this.articleId;
    data['title'] = this.title;
    data['link'] = this.link;
    data['keywords'] = this.keywords;
    data['creator'] = this.creator;
    data['video_url'] = this.videoUrl;
    data['description'] = this.description;
    data['content'] = this.content;
    data['pubDate'] = this.pubDate;
    data['image_url'] = this.imageUrl;
    data['source_id'] = this.sourceId;
    data['source_priority'] = this.sourcePriority;
    data['country'] = this.country;
    data['category'] = this.category;
    data['language'] = this.language;
    return data;
  }
}
