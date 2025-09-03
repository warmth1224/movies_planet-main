// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

abstract class FailureCode extends Equatable {
  final String message;
  const FailureCode(
    this.message,
  );

  @override
  List<Object> get props => [message];
}

class ServerFailure extends FailureCode {
  const ServerFailure(super.message);
}

class DatabaseFailure extends FailureCode {
  const DatabaseFailure(super.message);
}
