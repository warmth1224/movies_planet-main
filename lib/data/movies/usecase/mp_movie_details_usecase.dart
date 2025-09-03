import 'package:dartz/dartz.dart';
import 'package:movies_planet/data/errors/failure_code.dart';

import 'package:movies_planet/data/model/mp_media_details.dart';
import 'package:movies_planet/data/repositories/mp_movies_repository.dart';
import 'package:movies_planet/data/usecase/mp_use_case.dart';

class MPMoviesDetailUseCase extends MPUseCase<MpMediaDetails, int> {
  final MPMoviesRepository _moviesRepository;

  MPMoviesDetailUseCase(this._moviesRepository);

  @override
  Future<Either<FailureCode, MpMediaDetails>> call(int p) async =>
      await _moviesRepository.getMoviesDetails(p);
}
