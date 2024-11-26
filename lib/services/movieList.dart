import 'package:entertaiment_app/services/movie_model.dart';
import 'package:entertaiment_app/services/networking.dart';

const url = "assets/data.json";

class MovieList {
  Future<List<MovieModel>> getMovies() async {
    NetworkHelper networkHelper = NetworkHelper(url);
    var moviesData = await networkHelper.getData();
    List<MovieModel> movies = [];

    for (var movie in moviesData) {
      movies.add(MovieModel.fromJson(movie));
    }

    return movies;
  }
}
