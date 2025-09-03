// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:movies_planet/data/errors/failure_code.dart';
import 'package:movies_planet/data/model/mp_media.dart';
import 'package:movies_planet/data/repositories/mp_watch_list_repository.dart';
import 'package:movies_planet/data/usecase/mp_use_case.dart';

class AddWatchListItemsUseCase extends MPUseCase<int, MpMedia> {
  AddWatchListItemsUseCase(
    this._repository,
  );
  final MPWatchListRepository _repository;

  @override
  Future<Either<FailureCode, int>> call(MpMedia p) async {
    return await _repository.addItem(p);
  }
}
