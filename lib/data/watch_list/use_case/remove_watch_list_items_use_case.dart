import 'package:movies_planet/data/errors/failure_code.dart';
import 'package:movies_planet/data/repositories/mp_watch_list_repository.dart';
import 'package:movies_planet/data/usecase/mp_use_case.dart';
import 'package:dartz/dartz.dart';

class RemoveWatchListItemsUseCase extends MPUseCase<Unit, int> {
  final MPWatchListRepository _repository;

  RemoveWatchListItemsUseCase(this._repository);

  @override
  Future<Either<FailureCode, Unit>> call(int p) async {
    return await _repository.removeItem(p);
  }
}
