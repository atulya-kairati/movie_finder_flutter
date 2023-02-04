import 'package:flutter/material.dart';
import 'package:movie_recommendation_app/features/movie_flow/genre/list_card.dart';

import '../../../core/constants.dart';
import '../../../core/widgets/primary_button.dart';
import 'genre.dart';

class GenreScreen extends StatefulWidget {
  const GenreScreen(
      {super.key, required this.nextPage, required this.previousPage});

  final VoidCallback nextPage;
  final VoidCallback previousPage;

  @override
  State<GenreScreen> createState() => _GenreScreenState();
}

class _GenreScreenState extends State<GenreScreen> {
  List<Genre> genres = const [
    Genre(name: "Action"),
    Genre(name: "Horror"),
    Genre(name: "Fantasy"),
    Genre(name: "Thriller"),
    Genre(name: "Sci-fi"),
    Genre(name: "Anime"),
    Genre(name: "Comedy"),
    Genre(name: "Noir"),
  ];

  void toggleSelected(Genre genre) {
    List<Genre> updatedGenres = [
      for (final oldGenre in genres)
        if (oldGenre == genre) oldGenre.toggleSelected() else oldGenre
    ];

    setState(() {
      genres = updatedGenres;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: BackButton(onPressed: widget.previousPage)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: kMediumSpacing / 2),
            Text(
              "Genre",
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  ?.copyWith(color: Colors.white),
              textAlign: TextAlign.center,
            ),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(vertical: kListItemSpacing),
                itemBuilder: (context, index) {
                  final genre = genres[index];
                  return ListCard(
                    genre: genre,
                    onTap: () => toggleSelected(genre),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(height: kListItemSpacing);
                },
                itemCount: genres.length,
              ),
            ),
            PrimaryButton(onPressed: widget.nextPage, text: "Continue"),
            const SizedBox(height: kMediumSpacing),
          ],
        ),
      ),
    );
  }
}
