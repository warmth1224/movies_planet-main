import 'package:movies_planet/data/model/mp_season.dart';
import 'package:movies_planet/utils/mp_functions.dart';

class SeasonModel extends MPSeason {
  const SeasonModel(
      {required super.tmdbID,
      required super.name,
      required super.episodeCount,
      required super.airDate,
      required super.overview,
      required super.posterUrl,
      required super.seasonNumber});

  factory SeasonModel.fromMap(Map<String, dynamic> map) {
    return SeasonModel(
        tmdbID: map['id'],
        name: map['name'],
        episodeCount: map['episode_count'],
        airDate: getDate(map['air_date']),
        overview: map['overview'],
        posterUrl: getPosterUrl(map['poster_path']),
        seasonNumber: map['season_number']);
  }
}
