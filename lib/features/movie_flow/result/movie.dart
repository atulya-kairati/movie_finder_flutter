import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:movie_recommendation_app/features/movie_flow/genre/genre.dart';

@immutable
class Movie {
  final String title;
  final String overview;
  final num voteAverage;
  final List<Genre> genres;
  final String releaseDate;
  final String? backdropPath;
  final String? posterPath;

  const Movie({
    required this.title,
    required this.overview,
    required this.voteAverage,
    required this.genres,
    required this.releaseDate,
    this.backdropPath = "",
    this.posterPath = "",
  });

  Movie.intial()
      : title = "",
        overview = "",
        voteAverage = 0,
        genres = [],
        releaseDate = "",
        backdropPath = "",
        posterPath = "";

  String get genresCommaSeperated => genres.map((e) => e.name).join(", ");

  @override
  String toString() {
    return "Movie[title: $title, overview: $overview, voteAverage: $voteAverage, genres: $genres, releaseDate: $releaseDate, backdropPath: $backdropPath, posterPath: $posterPath]";
  }

  @override
  int get hashCode =>
      title.hashCode ^
      overview.hashCode ^
      voteAverage.hashCode ^
      genres.hashCode ^
      releaseDate.hashCode ^
      backdropPath.hashCode ^
      posterPath.hashCode;

  @override
  bool operator ==(Object other) {
    return other is Movie &&
        other.title == title &&
        other.overview == overview &&
        other.voteAverage == voteAverage &&
        listEquals(other.genres, genres) &&
        other.releaseDate == releaseDate &&
        other.backdropPath == backdropPath &&
        other.posterPath == posterPath;
  }
}
