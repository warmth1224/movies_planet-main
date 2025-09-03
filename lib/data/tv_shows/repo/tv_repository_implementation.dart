import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movies_planet/data/errors/exceptions.dart';

import 'package:movies_planet/data/errors/failure_code.dart';
import 'package:movies_planet/data/model/mp_media.dart';
import 'package:movies_planet/data/model/mp_media_details.dart';
import 'package:movies_planet/data/model/mp_season_detail.dart';
import 'package:movies_planet/data/repositories/mp_tv_repository.dart';
import 'package:movies_planet/data/tv_shows/data_source/mp_tv_show_remote_data_source.dart';
import 'package:movies_planet/resources/mp_season_detail_params.dart';

class TvRepositoryImplementation extends MPTvRepository {
  TvRepositoryImplementation(
    this._dataSource,
  );
  final MPTvShowsRemoteDataSource _dataSource;
  @override
  Future<Either<FailureCode, List<MpMedia>>> popularTvShows(int page) async {
    try {
      final result = await _dataSource.allPopularTVShows(page);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.statusMessage));
    } on DioException catch (dio) {
      return Left(ServerFailure(dio.message!));
    }
  }

  @override
  Future<Either<FailureCode, MPSeasonDetails>> seasonDetail(
      MPSeasonDetailParams params) async {
    try {
      final result = await _dataSource.seasonDetails(params);

      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.statusMessage));
    } on DioException catch (e) {
      return Left(ServerFailure(e.message!));
    }
  }

  @override
  Future<Either<FailureCode, List<MpMedia>>> topRatedTvShows(int page) async {
    try {
      final result = await _dataSource.allTopRatedTVShows(page);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.statusMessage));
    } on DioException catch (e) {
      return Left(ServerFailure(e.message!));
    }
  }

  @override
  Future<Either<FailureCode, List<List<MpMedia>>>> tvShows() async {
    try {
      final result = await _dataSource.tvShows();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.statusMessage));
    } on DioException catch (e) {
      return Left(ServerFailure(e.message!));
    }
  }

  @override
  Future<Either<FailureCode, MpMediaDetails>> tvShowsDetail(int id) async {
    try {
      final result = await _dataSource.tvShowDetails(id);
      // print(result);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.statusMessage));
    } on DioException catch (e) {
      return Left(ServerFailure(e.message!));
    }
  }
}
