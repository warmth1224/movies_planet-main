import 'package:dio/dio.dart';
import 'package:movies_planet/data/errors/exceptions.dart';
import 'package:movies_planet/data/model/error_message_model.dart';
import 'package:movies_planet/data/network/api_constants.dart';
import 'package:movies_planet/data/tv_shows/data_source/mp_tv_show_remote_data_source.dart';
import 'package:movies_planet/data/tv_shows/model/detail_model.dart';
import 'package:movies_planet/data/tv_shows/model/tv_show_detail_model.dart';
import 'package:movies_planet/data/tv_shows/model/tv_show_model.dart';
import 'package:movies_planet/resources/mp_season_detail_params.dart';

class MPTvShowsRemoteDataSourceImplementation
    extends MPTvShowsRemoteDataSource {
  @override
  Future<List<TVShowModel>> allPopularTVShows(int page) async {
    final result = await Dio().get(MpApi.allPopularTvShowsPath(page));
    if (result.statusCode == 200) {
      return List<TVShowModel>.from(
          (result.data['results'] as List).map((e) => TVShowModel.fromMap(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromMap(result.data));
    }
  }

  @override
  Future<List<TVShowModel>> allTopRatedTVShows(int page) async {
    final result = await Dio().get(MpApi.allTopRatedTvShowsPath(page));
    if (result.statusCode == 200) {
      return List<TVShowModel>.from(
          (result.data['results'] as List).map((e) => TVShowModel.fromMap(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromMap(result.data));
    }
  }

  @override
  Future<List<TVShowModel>> onAirTVShows() async {
    final result = await Dio().get(MpApi.onAirTvShowPath);
    if (result.statusCode == 200) {
      return List<TVShowModel>.from(
          (result.data['results'] as List).map((e) => TVShowModel.fromMap(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromMap(result.data));
    }
  }

  @override
  Future<List<TVShowModel>> popularTVShows() async {
    final result = await Dio().get(MpApi.popularTvShowsPath);
    if (result.statusCode == 200) {
      return List<TVShowModel>.from(
          (result.data['results'] as List).map((e) => TVShowModel.fromMap(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromMap(result.data));
    }
  }

  @override
  Future<SeasonDetailModel> seasonDetails(MPSeasonDetailParams params) async {
    final result = await Dio().get(MpApi.getSeasonDetailsPath(params));
    if (result.statusCode == 200) {
      return SeasonDetailModel.fromMap(result.data);
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromMap(result.data));
    }
  }

  @override
  Future<List<TVShowModel>> topRatedTVShows() async {
    final result = await Dio().get(MpApi.topRatedTvShowsPath);
    if (result.statusCode == 200) {
      return List<TVShowModel>.from(
          (result.data['results'] as List).map((e) => TVShowModel.fromMap(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromMap(result.data));
    }
  }

  @override
  Future<TVShowDetailsModel> tvShowDetails(int showID) async {
    final result = await Dio().get(MpApi.getTvShowDetailsPath(showID));
    if (result.statusCode == 200) {
      // print(result.data);
      return TVShowDetailsModel.fromMap(result.data);
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromMap(result.data));
    }
  }

  @override
  Future<List<List<TVShowModel>>> tvShows() async {
    return Future.wait([
      onAirTVShows(),
      popularTVShows(),
      topRatedTVShows(),
    ], eagerError: true);
  }
}
