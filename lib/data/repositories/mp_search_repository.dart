import 'package:dartz/dartz.dart';
import 'package:movies_planet/data/errors/failure_code.dart';
import 'package:movies_planet/data/model/mp_search.dart';

abstract class MpSearchRepository {
  Future<Either<FailureCode, List<MpSearch>>> search(String query);
}
