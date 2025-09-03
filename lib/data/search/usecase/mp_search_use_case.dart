import 'package:dartz/dartz.dart';
import 'package:movies_planet/data/errors/failure_code.dart';
import 'package:movies_planet/data/model/mp_search.dart';
import 'package:movies_planet/data/repositories/mp_search_repository.dart';
import 'package:movies_planet/data/usecase/mp_use_case.dart';

class MpSearchUseCase extends MPUseCase<List<MpSearch>, String> {
  final MpSearchRepository _repository;

  MpSearchUseCase(this._repository);

  @override
  Future<Either<FailureCode, List<MpSearch>>> call(String p) async {
    return await _repository.search(p);
  }
}
