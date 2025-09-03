import 'package:movies_planet/data/movies/data_source/mp_remote_data_source.dart';
import 'package:movies_planet/data/errors/exceptions.dart';
import 'package:movies_planet/data/model/error_message_model.dart';
import 'package:movies_planet/data/movies/model/movies_model.dart';
import 'package:movies_planet/data/movies/model/movies_detail_model.dart';
import 'package:movies_planet/data/network/api_constants.dart';
import 'package:dio/dio.dart';

class MpMoviesDataSourceImplement extends MpRemoteDataSource {
  @override
  Future<List<MovieModel>> getAllPopularMovies(int movieId) async {
    final response = await Dio().get(MpApi.getPopularMoviePath(movieId));
    if (response.statusCode == 200) {
      return List<MovieModel>.from(
          (response.data['results'] as List).map((e) => MovieModel.fromMap(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromMap(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getAllTopRatedMovies(int page) async {
    final response = await Dio().get(MpApi.getTopRatedMoviePath(page));
    if (response.statusCode == 200) {
      return List<MovieModel>.from(
          (response.data['results'] as List).map((e) => MovieModel.fromMap(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromMap(response.data));
    }
  }

  @override
  Future<MoviesDetailModel> getMovieDetail(int movieId) async {
    final response = await Dio().get(MpApi.getMovieDetailsPath(movieId));
    if (response.statusCode == 200) {
      return MoviesDetailModel.fromMap(response.data);
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromMap(response.data));
    }
  }

  @override
  Future<List<List<MovieModel>>> getMovies() async {
    final response = Future.wait([
      getNowPlayingMovie(),
      getPopularMovies(),
      getTopRatedMovies(),
    ], eagerError: true);
    return response;
  }

  @override
  Future<List<MovieModel>> getNowPlayingMovie() async {
    final response = await Dio().get(MpApi.nowPlayingMoviesPath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List)
          .map((e) => MovieModel.fromMap(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromMap(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await Dio().get(MpApi.popularMoviesPath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List)
          .map((e) => MovieModel.fromMap(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromMap(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final response = await Dio().get(MpApi.topRatedMoviesPath);
    if (response.statusCode == 200) {
      List<MovieModel> topMovies = List<MovieModel>.from(
          (response.data['results'] as List)
              .map((e) => MovieModel.fromMap(e)));
      // print(topMovies);
      return topMovies;
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromMap(response.data));
    }
  }
}
