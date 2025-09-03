import 'package:equatable/equatable.dart';

class MpCast extends Equatable {
  final String name;
  final String profileUrl;
  final int gender;

  const MpCast({
    required this.name,
    required this.profileUrl,
    required this.gender,
  });

  @override
  List<Object?> get props => [
        name,
        profileUrl,
        gender,
      ];
}
