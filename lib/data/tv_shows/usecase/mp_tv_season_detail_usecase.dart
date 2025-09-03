import 'package:dartz/dartz.dart';
import 'package:movies_planet/data/errors/failure_code.dart';
import 'package:movies_planet/data/model/mp_season_detail.dart';
import 'package:movies_planet/data/repositories/mp_tv_repository.dart';
import 'package:movies_planet/data/usecase/mp_use_case.dart';
import '../../../resources/mp_season_detail_params.dart';

class GetTvSeasonDetailUseCase
    extends MPUseCase<MPSeasonDetails, MPSeasonDetailParams> {
  GetTvSeasonDetailUseCase(
    this._repository,
  );
  final MPTvRepository _repository;

  @override
  Future<Either<FailureCode, MPSeasonDetails>> call(
      MPSeasonDetailParams p) async {
    return await _repository.seasonDetail(p);
  }
}
