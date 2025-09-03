import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movies_planet/data/errors/exceptions.dart';
import 'package:movies_planet/data/errors/failure_code.dart';
import 'package:movies_planet/data/model/mp_search.dart';
import 'package:movies_planet/data/repositories/mp_search_repository.dart';
import 'package:movies_planet/data/search/data_source/mp_search_data_source.dart';

class SearchRepositoryImplementation implements MpSearchRepository {
  SearchRepositoryImplementation(this._dataSource);
  final MpSearchDataSource _dataSource;
  @override
  Future<Either<FailureCode, List<MpSearch>>> search(String query) async {
    try {
      final result = await _dataSource.search(query);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.statusMessage));
    } on DioException catch (e) {
      return Left(ServerFailure(e.message!));
    }
  }
}
