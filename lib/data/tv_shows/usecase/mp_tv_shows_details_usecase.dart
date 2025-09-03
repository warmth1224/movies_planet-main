import 'package:dartz/dartz.dart';
import 'package:movies_planet/data/errors/failure_code.dart';
import 'package:movies_planet/data/model/mp_media_details.dart';
import 'package:movies_planet/data/repositories/mp_tv_repository.dart';
import 'package:movies_planet/data/usecase/mp_use_case.dart';

class GetTvShowsDetailUseCase extends MPUseCase<MpMediaDetails, int> {
  GetTvShowsDetailUseCase(
    this._repository,
  );
  final MPTvRepository _repository;

  @override
  Future<Either<FailureCode, MpMediaDetails>> call(int p) async {
    final result = await _repository.tvShowsDetail(p);

    return result;
  }
}
