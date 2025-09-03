import 'package:dartz/dartz.dart';
import 'package:movies_planet/data/errors/failure_code.dart';
import 'package:movies_planet/data/model/mp_media.dart';
import 'package:movies_planet/data/model/mp_media_details.dart';
import 'package:movies_planet/data/model/mp_season_detail.dart';
import 'package:movies_planet/resources/mp_season_detail_params.dart';

abstract class MPTvRepository {
  Future<Either<FailureCode, List<List<MpMedia>>>> tvShows();
  Future<Either<FailureCode, MpMediaDetails>> tvShowsDetail(int id);
  Future<Either<FailureCode, MPSeasonDetails>> seasonDetail(
      MPSeasonDetailParams params);
  Future<Either<FailureCode, List<MpMedia>>> popularTvShows(int page);
  Future<Either<FailureCode, List<MpMedia>>> topRatedTvShows(int page);
}
