import 'package:equatable/equatable.dart';

class MPSeasonDetailParams extends Equatable {
  const MPSeasonDetailParams(this.id, this.seasonNumber);
  final int id;
  final int seasonNumber;

  @override
  List<Object> get props => [id, seasonNumber];
}
