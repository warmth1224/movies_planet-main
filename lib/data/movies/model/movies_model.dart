import 'package:movies_planet/data/model/mp_media.dart';
import 'package:movies_planet/utils/mp_functions.dart';

class MovieModel extends MpMedia {
  const MovieModel(
      {required super.tmdbID,
      required super.title,
      required super.posterUrl,
      required super.backdropUrl,
      required super.averageVote,
      required super.releaseDate,
      required super.overview,
      required super.isMovie});

  factory MovieModel.fromMap(Map<String, dynamic> json) => MovieModel(
      tmdbID: json['id'],
      title: json['title'],
      posterUrl: getPosterUrl(json['poster_path']),
      backdropUrl: getBackdropUrl(json['backdrop_path']),
      averageVote: json['vote_average'].toDouble(),
      releaseDate: getDate(json['release_date']),
      overview: json['overview'] ?? '',
      isMovie: true);
}
