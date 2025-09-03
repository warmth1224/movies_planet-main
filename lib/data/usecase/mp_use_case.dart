import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_planet/data/errors/failure_code.dart';

abstract class MPUseCase<T, P> {
  Future<Either<FailureCode, T>> call(P p);
}

class NoParameters extends Equatable {
  const NoParameters();
  @override
  List<Object?> get props => [];
}
