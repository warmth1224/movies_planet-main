import 'package:dartz/dartz.dart';
import 'package:movies_planet/data/errors/failure_code.dart';
import 'package:movies_planet/data/model/mp_media.dart';
import 'package:movies_planet/data/repositories/mp_movies_repository.dart';
import 'package:movies_planet/data/usecase/mp_use_case.dart';

class MoviesUseCase extends MPUseCase<List<List<MpMedia>>, NoParameters> {
  final MPMoviesRepository _mpMoviesRepository;
  MoviesUseCase(this._mpMoviesRepository);

  @override
  Future<Either<FailureCode, List<List<MpMedia>>>> call(NoParameters p) {
    return _mpMoviesRepository.getMovies();
  }
}
