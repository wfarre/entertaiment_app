import 'dart:ffi';

import 'package:entertaiment_app/constants.dart';
import 'package:entertaiment_app/services/movieList.dart';
import 'package:entertaiment_app/services/movie_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../components/large_movie_card.dart';
import '../components/movie_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<MovieModel> trendingMovies;
  var regularMovies = [];
  late Future<List<MovieModel>> movies;

  @override
  void initState() {
    print("hello");
    super.initState();
    getMovies();
  }

  Future<void> getMovies() async {
    print("get movies");
    MovieList moviesList = MovieList();
    movies = moviesList.getMovies();
    movies.then((data) => {updateMovies(data)});
    // List<MovieModel> blabla = [];
    // movies.then((data) {
    //   print("opps");
    //   print(data);
    //   for (var movie in data) {
    //     if (movie.isTrending) {
    //       blabla.add(movie);
    //     }
    //   }
    // });
    // trendingMovies = blabla;
  }

  void updateMovies(List<MovieModel> movies) {
    List<MovieModel> blabla = [];
    for (var movie in movies) {
      print("nyanya");
      if (movie.isTrending) {
        blabla.add(movie);
      }
    }
    trendingMovies = blabla as List<MovieModel>;
    print(trendingMovies);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgPrimary,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: kBgSeconday,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(
              Icons.movie,
              color: kPrimaryColor,
            ),
            Row(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.grid_view_rounded,
                      color: Colors.white,
                    )),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.local_movies_rounded),
                  color: kSecondaryColor,
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.tv,
                      color: kSecondaryColor,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.bookmark,
                      color: kSecondaryColor,
                    )),
              ],
            ),
            // IconButton(onPressed: () {}, icon: const Icon(Icons.circle))

            Container(
              height: 24.0,
              width: 24.0,
              padding: EdgeInsets.all(1.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50.0)),
                  color: Colors.white),
              child: CircleAvatar(
                backgroundImage: AssetImage("assets/image-avatar.png"),
                backgroundColor: Colors.white,
              ),
            )
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 24.0,
            ),
            const TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Search for movies or TV series",
                    hintStyle: TextStyle(color: kSecondaryColor),
                    icon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ))),
            const SizedBox(
              height: 24.0,
            ),
            const Text(
              "Trending",
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
            const SizedBox(
              height: 24.0,
            ),
            SizedBox(
              height: 140,
              child: GridBuilder(
                  movies: movies,
                  scrollDirection: Axis.horizontal,
                  isTrendingType: true),
            ),
            const SizedBox(
              height: 24.0,
            ),
            const Text(
              "Recommended for you",
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
            const SizedBox(
              height: 24.0,
            ),
            Expanded(flex: 2, child: GridBuilder(movies: movies)),
          ],
        ),
      ),
    );
  }
}

class GridBuilder extends StatelessWidget {
  const GridBuilder(
      {super.key,
      required this.movies,
      this.scrollDirection = Axis.vertical,
      this.isTrendingType = false});

  final Future<List<MovieModel>> movies;
  final Axis scrollDirection;
  final bool isTrendingType;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: movies,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return GridView.builder(
              shrinkWrap: true,
              scrollDirection: scrollDirection,
              itemCount: snapshot.data?.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: isTrendingType ? 140 / 240 : 1.0,
                mainAxisSpacing: 16.0,
                crossAxisSpacing: 16.0,
                crossAxisCount: isTrendingType ? 1 : 2,
              ),
              itemBuilder: (context, index) {
                if (isTrendingType) {
                  if (snapshot.data?[index].isTrending) {
                    return LargeMovieCard(
                      title: snapshot.data?[index].title,
                      picture: snapshot.data?[index].trendingImageUrl,
                      type: snapshot.data?[index].category,
                      releasedyear: snapshot.data?[index].year,
                      rating: snapshot.data?[index].rating,
                      isBookmarked: snapshot.data?[index].isBookmarked,
                    );
                  }
                } else {
                  return MovieCard(
                    title: snapshot.data?[index].title,
                    picture: snapshot.data?[index].regularImageUrl,
                    type: snapshot.data?[index].category,
                    releasedyear: snapshot.data?[index].year,
                    rating: snapshot.data?[index].rating,
                    isBookmarked: snapshot.data?[index].isBookmarked,
                  );
                }
              });
        } else if (snapshot.hasError) {
          return Text("Error");
        }
        return Text("Loading...");
      },
    );
  }
}
