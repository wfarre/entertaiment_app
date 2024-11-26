import 'dart:ui';

import 'package:entertaiment_app/components/bookmark_icon.dart';
import 'package:flutter/material.dart';

class LargeMovieCard extends StatelessWidget {
  const LargeMovieCard({
    super.key,
    required this.title,
    required this.type,
    required this.releasedyear,
    required this.rating,
    required this.isBookmarked,
    this.picture = "assets/thumbnails/undiscovered-cities/trending/",
  });

  final String title;
  final String type;
  final String rating;
  final String picture;
  final bool isBookmarked;
  final int releasedyear;

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Container(
        height: 140,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          image: DecorationImage(image: AssetImage(picture), fit: BoxFit.fill),
        ),
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [BookmarkIcon(isBookmarked: isBookmarked)],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                  Text(
                    rating,
                    style: const TextStyle(color: Colors.white),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
