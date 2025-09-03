import 'package:dartz/dartz.dart';
import 'package:movies_planet/data/errors/failure_code.dart';
import 'package:movies_planet/data/model/mp_media.dart';
import 'package:movies_planet/data/repositories/mp_watch_list_repository.dart';
import 'package:movies_planet/data/usecase/mp_use_case.dart';

class GetWatchListItemsUseCase extends MPUseCase<List<MpMedia>, NoParameters> {
  final MPWatchListRepository _watchListRepository;
  GetWatchListItemsUseCase(this._watchListRepository);

  @override
  Future<Either<FailureCode, List<MpMedia>>> call(NoParameters p) async {
    return await _watchListRepository.getWatchListItems();
  }
}
