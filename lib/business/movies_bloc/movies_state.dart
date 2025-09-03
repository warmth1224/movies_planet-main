// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:movies_planet/data/model/mp_media.dart';

import '../../utils/enums.dart';

class MoviesState extends Equatable {
  final List<List<MpMedia>> movies;
  final RequestStatus status;
  final String message;
  const MoviesState({
  this.movies = const[],
   this.status = RequestStatus.loading,
     this.message ='',
  });

  @override
  List<Object> get props => [movies, status, message];

  MoviesState copyWith({
    List<List<MpMedia>>? movies,
    RequestStatus? status,
    String? message,
  }) {
    return MoviesState(
      movies: movies ?? this.movies,
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }
}
