import 'package:movies_planet/data/model/mp_episode.dart';
import 'package:movies_planet/utils/mp_functions.dart';

class EpisodeModel extends MPEpisode {
  const EpisodeModel(
      {required super.number,
      required super.season,
      required super.name,
      required super.runtime,
      required super.stillPath,
      required super.airDate});

  factory EpisodeModel.fromMap(Map<String, dynamic> map) {
    return EpisodeModel(
      number: map['episode_number'],
      season: map['season_number'],
      name: map['name'],
      runtime: getLength(map['runtime']),
      stillPath: getStillUrl(map['still_path']),
      airDate: getDate(map['air_date']),
    );
  }
}
