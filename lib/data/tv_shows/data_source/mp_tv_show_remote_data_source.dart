import 'package:movies_planet/data/tv_shows/model/detail_model.dart';
import 'package:movies_planet/data/tv_shows/model/tv_show_detail_model.dart';
import 'package:movies_planet/data/tv_shows/model/tv_show_model.dart';
import 'package:movies_planet/resources/mp_season_detail_params.dart';

abstract class MPTvShowsRemoteDataSource {
  Future<List<TVShowModel>> onAirTVShows();
  Future<List<TVShowModel>> popularTVShows();
  Future<List<TVShowModel>> topRatedTVShows();
  Future<List<List<TVShowModel>>> tvShows();
  Future<TVShowDetailsModel> tvShowDetails(int showID);
  Future<SeasonDetailModel> seasonDetails(MPSeasonDetailParams params);
  Future<List<TVShowModel>> allPopularTVShows(int page);
  Future<List<TVShowModel>> allTopRatedTVShows(int page);
}

