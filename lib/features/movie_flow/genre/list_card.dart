import 'package:flutter/material.dart';
import 'package:movie_recommendation_app/core/constants.dart';
import 'package:movie_recommendation_app/features/movie_flow/genre/genre.dart';

class ListCard extends StatelessWidget {
  const ListCard({super.key, required this.genre, required this.onTap});

  final Genre genre;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      //UnconstrainedBox: So that size of the ListCard is not goverened by the ListView
      child: Material(
        color: genre.isSelected
            ? Theme.of(context).colorScheme.primary
            : Colors.transparent,
        borderRadius: const BorderRadius.all(Radius.circular(kBorderRadius)),
        child: InkWell(
          borderRadius: BorderRadius.circular(kBorderRadius),
          onTap: onTap,
          child: Container(
            width: 140,
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Text(
              genre.name,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
