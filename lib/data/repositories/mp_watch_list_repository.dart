import 'package:dartz/dartz.dart';
import 'package:movies_planet/data/errors/failure_code.dart';
import 'package:movies_planet/data/model/mp_media.dart';

abstract class MPWatchListRepository {
  Future<Either<FailureCode, List<MpMedia>>> getWatchListItems();
  Future<Either<FailureCode, int>> addItem(MpMedia media);
  Future<Either<FailureCode, Unit>> removeItem(int index);
  Future<Either<FailureCode, int>> checkForDuplicate(int tmdbId);
}
