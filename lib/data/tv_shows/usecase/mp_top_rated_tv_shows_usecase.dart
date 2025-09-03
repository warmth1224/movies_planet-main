// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:movies_planet/data/errors/failure_code.dart';
import 'package:movies_planet/data/model/mp_media.dart';
import 'package:movies_planet/data/repositories/mp_tv_repository.dart';
import 'package:movies_planet/data/usecase/mp_use_case.dart';

class GetTopRatedTVShowsUseCase extends MPUseCase<List<MpMedia>, int> {
 final MPTvRepository _tvRepository;
  GetTopRatedTVShowsUseCase(
    this._tvRepository,
  );
  @override
  Future<Either<FailureCode, List<MpMedia>>> call(int p) async {
    return await _tvRepository.topRatedTvShows(p);
  }
}
