import 'package:entertaiment_app/components/bookmark_icon.dart';
import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({
    super.key,
    required this.title,
    required this.type,
    required this.releasedyear,
    required this.rating,
    required this.isBookmarked,
    this.picture = "assets/thumbnails/lone-heart/regular/large.jpg",
  });

  final String title;
  final String type;
  final String rating;
  final String picture;
  final int releasedyear;
  final bool isBookmarked;

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 110,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(8.0)),
              image: DecorationImage(
                  image: AssetImage(picture), fit: BoxFit.contain),
            ),
            child: Container(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      BookmarkIcon(isBookmarked: isBookmarked),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Row(
            children: [
              Text(
                releasedyear.toString(),
                style: const TextStyle(color: Colors.white),
              ),
              const Text(
                "・",
                style: TextStyle(color: Colors.white),
              ),
              Text(
                type,
                style: const TextStyle(color: Colors.white),
              ),
              const Text(
                "・",
                style: TextStyle(color: Colors.white),
              ),
              Text(
                rating,
                style: const TextStyle(color: Colors.white),
              )
            ],
          ),
          const SizedBox(
            height: 4.0,
          ),
          Text(
            title,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
