import 'package:dartz/dartz.dart';
import '../../errors/failure_code.dart';
import '../../model/mp_media.dart';
import '../../repositories/mp_tv_repository.dart';
import '../../usecase/mp_use_case.dart';

class GetPopularTVShowsUseCase extends MPUseCase<List<MpMedia>, int> {
  final MPTvRepository _tvRepository;
  GetPopularTVShowsUseCase(
    this._tvRepository,
  );
  @override
  Future<Either<FailureCode, List<MpMedia>>> call(int p) async {
    return await _tvRepository.popularTvShows(p);
  }
}
