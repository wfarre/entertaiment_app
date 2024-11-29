import 'package:entertaiment_app/components/large_movie_card.dart';
import 'package:entertaiment_app/constants.dart';
import 'package:entertaiment_app/services/movieList.dart';
import 'package:entertaiment_app/services/movie_model.dart';
import 'package:entertaiment_app/utils/utils.dart';
import 'package:flutter/material.dart';
import '../components/movie_grid.dart';
import '../services/networking.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<MovieModel> movies = [];
  late List<MovieModel> filteredMovies = [];
  String currentPage = 'all';
  String search = '';
  String currentTitle = "Recommended for you";

  @override
  void initState() {
    super.initState();
    getMovies();
  }

  void filterMovies(String searchInput, String type, List<MovieModel> movies) {
    filteredMovies = movies;
    filteredMovies = filterByType(currentPage, movies);
    filteredMovies = filterBySearchInput(searchInput, filteredMovies);
    setState(() {
      filteredMovies = filteredMovies;
    });
  }

  void setCurrentTitle(String currentPage) {
    switch (currentPage) {
      case "movies":
        setState(() {
          currentTitle = "Movies";
        });
        break;
      case "series":
        setState(() {
          currentTitle = "TV Series";
        });
        break;
      case "favorites":
        setState(() {
          currentTitle = "Bookmarked Movies";
        });
        break;
      default:
        setState(() {
          currentTitle = "Recommended for you";
        });
        break;
    }
  }

  void handlePress(String newCurrentPage) {
    setState(() {
      currentPage = newCurrentPage;
      filterMovies(search, newCurrentPage, movies);
      setCurrentTitle(newCurrentPage);
    });
  }

  Future<void> getMovies() async {
    MovieList moviesList = MovieList();
    Future<List<MovieModel>> allMovies = moviesList.getMovies();
    allMovies.then((data) => setState(() {
          movies = data;
          filterMovies(search, currentPage, data);
        }));
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
              color: Color.fromARGB(255, 136, 129, 129),
            ),
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      handlePress("all");
                    },
                    icon: Icon(
                      Icons.grid_view_rounded,
                      color:
                          currentPage == "all" ? Colors.white : kSecondaryColor,
                    )),
                IconButton(
                  onPressed: () {
                    handlePress("movies");
                  },
                  icon: Icon(Icons.local_movies_rounded),
                  color:
                      currentPage == "movies" ? Colors.white : kSecondaryColor,
                ),
                IconButton(
                    onPressed: () {
                      handlePress("series");
                    },
                    icon: Icon(
                      Icons.tv,
                      color: currentPage == "series"
                          ? Colors.white
                          : kSecondaryColor,
                    )),
                IconButton(
                    onPressed: () {
                      handlePress("favorites");
                    },
                    icon: Icon(
                      Icons.bookmark,
                      color: currentPage == "favorites"
                          ? Colors.white
                          : kSecondaryColor,
                    )),
              ],
            ),
            Container(
              height: 24.0,
              width: 24.0,
              padding: EdgeInsets.all(1.0),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50.0)),
                  color: Colors.white),
              child: const CircleAvatar(
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
            TextField(
              onChanged: (value) {
                search = value;
                filterMovies(search, currentPage, movies);
              },
              style: TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Search for movies or TV series",
                hintStyle: TextStyle(color: kSecondaryColor),
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 24.0,
            ),
            Visibility(
              visible: currentPage == "all",
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Trending",
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
                  SizedBox(
                    height: 140,
                    child: MovieGrid(
                      movies: filteredMovies,
                      isTrendingType: true,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
                ],
              ),
            ),
            Text(
              currentTitle,
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
            const SizedBox(
              height: 24.0,
            ),
            Expanded(
              flex: 1,
              child: MovieGrid(
                  movies: currentPage == "favorites"
                      ? filteredMovies
                          .where((movie) =>
                              movie.category.toLowerCase() == "movie")
                          .toList()
                      : filteredMovies),
            ),
            // Visibility(
            //   visible: true,
            //   child: Expanded(
            //     flex: 1,
            //     child: Column(
            //       children: [
            //         const Text(
            //           "Bookmarked TV Series",
            //           style: TextStyle(color: Colors.white, fontSize: 20.0),
            //         ),
            //         const SizedBox(
            //           height: 24.0,
            //         ),
            //         SizedBox(
            //           height: double.infinity,
            //           child: MovieGrid(
            //               movies: filteredMovies
            //                   .where((movie) =>
            //                       movie.category.toLowerCase() == "tv series")
            //                   .toList()),
            //         ),
            //         const SizedBox(
            //           height: 24.0,
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
