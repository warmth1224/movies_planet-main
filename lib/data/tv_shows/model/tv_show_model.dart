import 'package:movies_planet/data/model/mp_media.dart';
import 'package:movies_planet/utils/mp_functions.dart';

class TVShowModel extends MpMedia {
  const TVShowModel(
      {required super.tmdbID,
      required super.title,
      required super.posterUrl,
      required super.backdropUrl,
      required super.averageVote,
      required super.releaseDate,
      required super.overview,
      required super.isMovie});

  factory TVShowModel.fromMap(Map<String, dynamic> map) {
    return TVShowModel(
        tmdbID: map['id'],
        title: map['name'],
        posterUrl: getPosterUrl(map['poster_path']),
        backdropUrl: getBackdropUrl(map['backdrop_path']),
        averageVote: map['vote_average'].toDouble(),
        releaseDate: getDate(map['first_air_date']),
        overview: map['overview'],
        isMovie: false);
  }
}
