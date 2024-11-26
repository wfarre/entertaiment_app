import 'package:flutter/material.dart';

import '../constants.dart';

class BookmarkIcon extends StatelessWidget {
  const BookmarkIcon({super.key, required this.isBookmarked});

  final bool isBookmarked;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(9.0),
      decoration: const BoxDecoration(
          color: kBgOpacityhalf,
          borderRadius: BorderRadius.all(Radius.circular(50.0))),
      child: Icon(
        isBookmarked ? Icons.bookmark : Icons.bookmark_outline,
        color: Colors.white,
      ),
    );
  }
}
