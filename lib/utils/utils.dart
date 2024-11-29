import 'package:entertaiment_app/services/movie_model.dart';

List<MovieModel> filterByType(String type, List<MovieModel> movies) {
  switch (type) {
    case "movies":
      return movies
          .where((movie) => movie.category.toLowerCase() == "movie")
          .toList();
    case "series":
      return movies
          .where((movie) => movie.category.toLowerCase() == "tv series")
          .toList();
    case "favorites":
      return movies.where((movie) => movie.isBookmarked).toList();
    default:
      return movies;
  }
}

List<MovieModel> filterBySearchInput(
    String searchInput, List<MovieModel> movies) {
  if (searchInput.isNotEmpty) {
    return movies
        .where((movie) =>
            movie.title.toLowerCase().contains(searchInput.toLowerCase()))
        .toList();
  }
  return movies;
}
