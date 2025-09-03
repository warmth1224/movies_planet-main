import 'package:movies_planet/data/movies/model/movies_model.dart';
import 'package:movies_planet/data/model/mp_media_details.dart';
import 'package:movies_planet/data/movies/model/cast_model.dart';
import 'package:movies_planet/data/movies/model/review_model.dart';
import 'package:movies_planet/utils/mp_functions.dart';

// ignore: must_be_immutable
class MoviesDetailModel extends MpMediaDetails {
  MoviesDetailModel(
      {required super.tmdbID,
      required super.title,
      required super.posterUrl,
      required super.backdropUrl,
      required super.releaseDate,
      required super.genres,
      required super.runtime,
      required super.overview,
      required super.averageVote,
      required super.voteCount,
      required super.trailerUrl,
      required super.cast,
      required super.reviews,
      required super.similar});

  factory MoviesDetailModel.fromMap(Map<String, dynamic> json) {
    return MoviesDetailModel(
        tmdbID: json['id'],
        title: json['title'],
        posterUrl: getPosterUrl(json['poster_path']),
        backdropUrl: getBackdropUrl(json['backdrop_path']),
        releaseDate: getDate(json['release_date']),
        runtime: getLength(json['runtime']),
        genres: getGenres(json['genres']),
        overview: json['overview'],
        averageVote:
            double.parse((json['vote_average'] as double).toStringAsFixed(1)),
        voteCount: getVoteCount(json['vote_count']),
        trailerUrl: getTrailerUrl(json),
        cast: List<CastModel>.from((json['credits']['cast'] as List)
            .map((e) => CastModel.fromMap(e))),
        reviews: List<ReviewModel>.from((json['reviews']['results'] as List)
            .map((e) => ReviewModel.fromMap(e))),
        similar: List<MovieModel>.from((json['similar']['results'] as List)
            .map((e) => MovieModel.fromMap(e))));
  }
}
