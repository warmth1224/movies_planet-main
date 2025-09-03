// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movies_planet/data/errors/failure_code.dart';
import 'package:movies_planet/data/model/mp_media.dart';
import 'package:movies_planet/data/watch_list/data_source/mp_watch_list_data_source.dart';
import 'package:movies_planet/data/watch_list/models/watch_list_model.dart';
import 'package:movies_planet/data/repositories/mp_watch_list_repository.dart';

class WatchListRepositoryImplementation extends MPWatchListRepository {
  
  WatchListRepositoryImplementation(
    this._dataSource,
  );
  final MPWatchListDataSource _dataSource;
  @override
  Future<Either<FailureCode, int>> addItem(MpMedia media) async {
    try {
      int id = await _dataSource.addItem(MPWatchListModel.fromMpMedia(media));
      return Right(id);
    } on HiveError catch (e) {
      return Left(DatabaseFailure(e.message));
    }
  }

  @override
  Future<Either<FailureCode, int>> checkForDuplicate(int tmdbId) async {
    try {
      final result = await _dataSource.checkForDuplicate(tmdbId);
      return Right(result);
    } on HiveError catch (e) {
      return Left(DatabaseFailure(e.message));
    }
  }

  @override
  Future<Either<FailureCode, List<MpMedia>>> getWatchListItems() async {
    try {
      final result = await _dataSource.getWatchListItems();
      return Right(result);
    } on HiveError catch (e) {
      return Left(DatabaseFailure(e.message));
    }
  }

  @override
  Future<Either<FailureCode, Unit>> removeItem(int index) async {
    try {
      await _dataSource.removeItem(index);
      return const Right(unit);
    } on HiveError catch (e) {
      return Left(DatabaseFailure(e.message));
    }
  }
}
