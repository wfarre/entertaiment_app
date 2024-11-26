class MovieModel {
  MovieModel(
      {required this.title,
      required this.rating,
      required this.isTrending,
      required this.isBookmarked,
      required this.category,
      this.trendingImageUrl,
      required this.regularImageUrl,
      required this.year});

  final String title;
  final String rating;
  final int year;
  final bool isTrending;
  final bool isBookmarked;
  final String category;
  final String? trendingImageUrl;
  final String regularImageUrl;

  factory MovieModel.fromJson(dynamic json) {
    return MovieModel(
      title: json['title'],
      rating: json['rating'],
      isTrending: json['isTrending'],
      isBookmarked: json['isBookmarked'],
      category: json['category'],
      trendingImageUrl: json['thumbnail']['trending']?['small'],
      regularImageUrl: json['thumbnail']['regular']['small'],
      year: json['year'],
    );
  }
}
