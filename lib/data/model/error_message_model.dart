import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable {
  const ErrorMessageModel({
    required this.statusCode,
    required this.statusMessage,
    required this.success,
  });

  final int statusCode;
  final String statusMessage;
  final bool success;

  factory ErrorMessageModel.fromMap(Map<String, dynamic> map) {
    return ErrorMessageModel(
      statusCode: (map['statusCode'] ?? 0) as int,
      statusMessage: (map['statusMessage'] ?? '') as String,
      success: (map['success'] ?? false) as bool,
    );
  }

  @override
  List<Object> get props => [statusCode, statusMessage, success];
}
