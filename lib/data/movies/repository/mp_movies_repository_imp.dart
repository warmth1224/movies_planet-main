// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:movies_planet/data/movies/data_source/mp_remote_data_source.dart';
import 'package:movies_planet/data/errors/exceptions.dart';
import 'package:movies_planet/data/errors/failure_code.dart';
import 'package:movies_planet/data/model/mp_media.dart';
import 'package:movies_planet/data/model/mp_media_details.dart';
import 'package:movies_planet/data/repositories/mp_movies_repository.dart';

class MpMoviesRepositoryImplement extends MPMoviesRepository {
  final MpRemoteDataSource _mpRemoteDataSource;
  MpMoviesRepositoryImplement(
    this._mpRemoteDataSource,
  );
  @override
  Future<Either<FailureCode, List<List<MpMedia>>>> getMovies() async {
    try {
      final result = await _mpRemoteDataSource.getMovies();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.statusMessage));
    } on DioException catch (e) {
      return Left(ServerFailure(e.message!));
    }
  }

  @override
  Future<Either<FailureCode, MpMediaDetails>> getMoviesDetails(
      int movieId) async {
    try {
      final result = await _mpRemoteDataSource.getMovieDetail(movieId);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.statusMessage));
    } on DioException catch (e) {
      return Left(ServerFailure(e.message!));
    }
  }

  @override
  Future<Either<FailureCode, List<MpMedia>>> getPopularMovies(int page) async {
    try {
      final result = await _mpRemoteDataSource.getAllPopularMovies(page);
      return right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.statusMessage));
    } on DioException catch (e) {
      return Left(ServerFailure(e.message!));
    }
  }

  @override
  Future<Either<FailureCode, List<MpMedia>>> getTopRatedMovies(int page) async {
    try {
      final result = await _mpRemoteDataSource.getAllTopRatedMovies(page);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.statusMessage));
    } on DioException catch (e) {
      return Left(ServerFailure(e.message!));
    }
  }
}
