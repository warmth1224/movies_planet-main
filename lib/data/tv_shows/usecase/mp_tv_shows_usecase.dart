import 'package:dartz/dartz.dart';
import 'package:movies_planet/data/errors/failure_code.dart';
import 'package:movies_planet/data/model/mp_media.dart';
import 'package:movies_planet/data/repositories/mp_tv_repository.dart';
import 'package:movies_planet/data/usecase/mp_use_case.dart';

class GetTvShowsUseCase extends MPUseCase<List<List<MpMedia>>, NoParameters> {
  final MPTvRepository _repository;

  GetTvShowsUseCase(this._repository);
  @override
  Future<Either<FailureCode, List<List<MpMedia>>>> call(NoParameters p) async {
    return await _repository.tvShows();
  }
}
