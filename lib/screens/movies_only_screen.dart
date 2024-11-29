// import 'package:flutter/material.dart';

// import '../components/movie_grid.dart';

// class MoviesOnlyScreen extends StatelessWidget {
//   const MoviesOnlyScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return return Scaffold(
//       backgroundColor: kBgPrimary,
//       appBar: AppBarMovies(currentPage),
//       body: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const SizedBox(
//               height: 24.0,
//             ),
//             TextField(
//               onChanged: (value) {
//                 search = value;
//                 filterMovies(search, movies);
//               },
//               style: TextStyle(color: Colors.white),
//               decoration: const InputDecoration(
//                 border: InputBorder.none,
//                 hintText: "Search for movies or TV series",
//                 hintStyle: TextStyle(color: kSecondaryColor),
//                 icon: Icon(
//                   Icons.search,
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//             const SizedBox(
//               height: 24.0,
//             ),
//             const Text(
//               "Trending",
//               style: TextStyle(color: Colors.white, fontSize: 20.0),
//             ),
//             const SizedBox(
//               height: 24.0,
//             ),
//             SizedBox(
//               height: 140,
//               child: MovieGrid(
//                 movies: filteredMovies,
//                 isTrendingType: true,
//                 scrollDirection: Axis.horizontal,
//               ),
//             ),
//             const SizedBox(
//               height: 24.0,
//             ),
//             const Text(
//               "Recommended for you",
//               style: TextStyle(color: Colors.white, fontSize: 20.0),
//             ),
//             const SizedBox(
//               height: 24.0,
//             ),
//             Expanded(flex: 2, child: MovieGrid(movies: filteredMovies)),
//           ],
//         ),
//       ),
//     );
//   }
// }
