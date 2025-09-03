// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:movies_planet/data/errors/failure_code.dart';
import 'package:movies_planet/data/model/mp_media.dart';
import 'package:movies_planet/data/repositories/mp_movies_repository.dart';
import 'package:movies_planet/data/usecase/mp_use_case.dart';

class MpPopularMoviesUseCase extends MPUseCase<List<MpMedia>, int> {
  final MPMoviesRepository _moviesRepository;
  MpPopularMoviesUseCase(
    this._moviesRepository,
  );
  @override
  Future<Either<FailureCode, List<MpMedia>>> call(int p) async {
    return await _moviesRepository.getPopularMovies(p);
  }
}
