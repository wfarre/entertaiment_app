import 'package:entertaiment_app/components/large_movie_card.dart';
import 'package:entertaiment_app/components/movie_card.dart';
import 'package:entertaiment_app/services/movieList.dart';
import 'package:flutter/material.dart';

import '../services/movie_model.dart';

class MovieGrid extends StatelessWidget {
  const MovieGrid(
      {super.key,
      required this.movies,
      this.scrollDirection = Axis.vertical,
      this.isTrendingType = false});

  final List<MovieModel> movies;
  final Axis scrollDirection;
  final bool isTrendingType;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: movies.length,
        scrollDirection: scrollDirection,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: isTrendingType ? 140 / 240 : 1.0,
          mainAxisSpacing: 16.0,
          crossAxisSpacing: 16.0,
          crossAxisCount: isTrendingType ? 1 : 2,
        ),
        itemBuilder: (context, index) {
          MovieModel movie = movies[index];
          if (isTrendingType) {
            if (movie.isTrending) {
              return LargeMovieCard(
                title: movie.title,
                picture: movie.trendingImageUrl ?? "string",
                type: movie.category,
                releasedyear: movie.year,
                rating: movie.rating,
                isBookmarked: movie.isBookmarked,
              );
            }
          } else {
            return MovieCard(
              title: movie.title,
              picture: movie.regularImageUrl,
              type: movie.category,
              releasedyear: movie.year,
              rating: movie.rating,
              isBookmarked: movie.isBookmarked,
            );
          }
        });
  }
}
