import 'package:movies_planet/data/model/mp_media_details.dart';
import 'package:movies_planet/data/tv_shows/model/episode_model.dart';
import 'package:movies_planet/data/tv_shows/model/season_model.dart';
import 'package:movies_planet/data/tv_shows/model/tv_show_model.dart';
import 'package:movies_planet/utils/mp_functions.dart';

// ignore: must_be_immutable
class TVShowDetailsModel extends MpMediaDetails {
  TVShowDetailsModel(
      {required super.tmdbID,
      required super.title,
      required super.posterUrl,
      required super.backdropUrl,
      required super.releaseDate,
      required super.lastEpisodeToAir,
      required super.genres,
      required super.overview,
      required super.averageVote,
      required super.voteCount,
      required super.trailerUrl,
      required super.numberOfSeasons,
      required super.seasons,
      required super.similar});
  factory TVShowDetailsModel.fromMap(Map<String, dynamic> map) {
    return TVShowDetailsModel(
      tmdbID: map['id'],
      title: map['name'],
      posterUrl: getPosterUrl(map['poster_path']),
      backdropUrl: getBackdropUrl(map['backdrop_path']),
      releaseDate: getDate(map['first_air_date']),
      lastEpisodeToAir: EpisodeModel.fromMap(map['last_episode_to_air']),
      genres: getGenres(map['genres']),
      overview: map['overview'],
      averageVote:
          double.parse((map['vote_average'] as double).toStringAsFixed(1)),
      voteCount: getVoteCount(map['vote_count']),
      trailerUrl: getTrailerUrl(map),
      numberOfSeasons: map['number_of_seasons'],
      seasons: List<SeasonModel>.from((map['seasons'] as List)
          .where((element) => element['name'] != 'Specials')
          .map((e) => SeasonModel.fromMap(e))),
      similar: List<TVShowModel>.from(
        (map['similar']['results'] as List).map(
          (e) => TVShowModel.fromMap(e),
        ),
      ),
    );
  }
}
