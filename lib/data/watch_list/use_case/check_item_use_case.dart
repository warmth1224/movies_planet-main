
import 'package:dartz/dartz.dart';
import 'package:movies_planet/data/errors/failure_code.dart';
import 'package:movies_planet/data/repositories/mp_watch_list_repository.dart';
import 'package:movies_planet/data/usecase/mp_use_case.dart';

class CheckItemAddedUseCase extends MPUseCase<int, int> {

  CheckItemAddedUseCase(
    this._repository,
  );
  final MPWatchListRepository _repository;
  @override
  Future<Either<FailureCode, int>> call(int p) async {
    return await _repository.checkForDuplicate(p);
  }
}
