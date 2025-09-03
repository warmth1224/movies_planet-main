import 'package:dartz/dartz.dart';
import 'package:movies_planet/data/errors/failure_code.dart';
import 'package:movies_planet/data/model/mp_media.dart';
import 'package:movies_planet/data/model/mp_media_details.dart';

abstract class MPMoviesRepository {
  Future<Either<FailureCode, List<List<MpMedia>>>> getMovies();
  Future<Either<FailureCode, MpMediaDetails>> getMoviesDetails(int movieId);
  Future<Either<FailureCode, List<MpMedia>>> getPopularMovies(int page);
  Future<Either<FailureCode, List<MpMedia>>> getTopRatedMovies(int page);
}
