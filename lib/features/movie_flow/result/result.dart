import 'package:flutter/material.dart';
import 'package:movie_recommendation_app/core/constants.dart';
import 'package:movie_recommendation_app/core/widgets/primary_button.dart';
import 'package:movie_recommendation_app/features/movie_flow/genre/genre.dart';
import 'package:movie_recommendation_app/features/movie_flow/result/movie.dart';

class ResultScreen extends StatefulWidget {
  static route({bool fullScreenDialog = false}) => MaterialPageRoute(
        builder: (context) => const ResultScreen(),
        fullscreenDialog: fullScreenDialog,
      );

  const ResultScreen({super.key});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  final double movieHeight = 150;

  final demoMovie = const Movie(
    title: "Bing Chiling",
    overview:
        "Xiàn zài wǒ yǒu bing chilling Wǒ hěn xǐ huān bing chilling Dàn shì sù dù yǔ jī qíng jiǔ bǐ bing chilling",
    voteAverage: 9.99,
    genres: [Genre(name: "Erotic"), Genre(name: "Thriller")],
    releaseDate: "1/4/2020",
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    const CoverImage(),
                    Positioned(
                      width: MediaQuery.of(context).size.width,
                      bottom: -(movieHeight / 2),
                      child: MovieImageDetail(
                        movie: demoMovie,
                        movieHeight: movieHeight,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: movieHeight / 2),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    demoMovie.overview,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: Colors.white),
                  ),
                )
              ],
            ),
          ),
          PrimaryButton(onPressed: (){
            Navigator.of(context).pop();
          }, text: "Find Another Movie"),
          const SizedBox(height: kMediumSpacing)
        ],
      ),
    );
  }
}

class MovieImageDetail extends StatelessWidget {
  const MovieImageDetail(
      {super.key, required this.movieHeight, required this.movie});

  final double movieHeight;
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          const SizedBox(
            width: 100,
            height: 150,
            child: Placeholder(),
          ),
          const SizedBox(width: kMediumSpacing),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie.title,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(color: Colors.white),
                ),
                Text(
                  movie.genresCommaSeperated,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Row(
                  children: [
                    Text(
                      movie.voteAverage.toString(),
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: Colors.white.withOpacity(0.6)),
                    ),
                    const Icon(
                      Icons.star_rounded,
                      size: 18,
                      color: Colors.amber,
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CoverImage extends StatelessWidget {
  const CoverImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 298),
      child: ShaderMask(
        shaderCallback: (bounds) {
          return LinearGradient(
            begin: Alignment.center,
            end: Alignment.bottomCenter,
            colors: [
              Theme.of(context).scaffoldBackgroundColor,
              Colors.transparent,
            ],
          ).createShader(
            Rect.fromLTWH(0, 0, bounds.width, bounds.height),
          );
        },
        child: Placeholder(),
      ),
    );
  }
}
