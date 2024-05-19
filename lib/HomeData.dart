import 'dart:convert';

class HomeData {
  final Map<String, DataSection> data;
  final int status;
  final String message;

  HomeData({required this.data, required this.status, required this.message});

  factory HomeData.fromJson(Map<String, dynamic> json) {
    var dataMap = json['data'] as Map<String, dynamic>;
    Map<String, DataSection> data = {};
    dataMap.forEach((key, value) {
      data[key] = DataSection.fromJson(value);
    });
    return HomeData(
      data: data,
      status: json['status'],
      message: json['message'],
    );
  }
}

class DataSection {
  final String title;
  final List<MovieItem>? items;

  DataSection({required this.title, required this.items});

  factory DataSection.fromJson(Map<String, dynamic> json) {
    var itemsList = json['items'] as List?;
    List<MovieItem>? items = itemsList != null
        ? itemsList.map((item) => MovieItem.fromJson(item)).toList()
        : null;
    return DataSection(
      title: json['title'],
      items: items,
    );
  }
}

class MovieItem {
  final String movieId;
  final String movieBannerUrl;
  final String movieTitle;
  final String streamUrl;
  final String movieDescription;
  final String movieLink;

  MovieItem({
    required this.movieId,
    required this.movieBannerUrl,
    required this.movieTitle,
    required this.streamUrl,
    required this.movieDescription,
    required this.movieLink,
  });

  factory MovieItem.fromJson(Map<String, dynamic> json) {
    return MovieItem(
      movieId: json['movie_id'],
      movieBannerUrl: json['movie_banner_url'],
      movieTitle: json['movie_title'],
      streamUrl: json['stream_url'],
      movieDescription: json['movie_description'],
      movieLink: json['movie_link'],
    );
  }
}
