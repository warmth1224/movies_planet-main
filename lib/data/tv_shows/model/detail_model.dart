import 'package:movies_planet/data/model/mp_season_detail.dart';
import 'package:movies_planet/data/tv_shows/model/episode_model.dart';

class SeasonDetailModel extends MPSeasonDetails {
  const SeasonDetailModel({required super.mpEpisodes});

  factory SeasonDetailModel.fromMap(Map<String, dynamic> map) {
    return SeasonDetailModel(
        mpEpisodes: List<EpisodeModel>.from(
            (map['episodes'] as List).map((e) => EpisodeModel.fromMap(e))));
  }
}
