// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

abstract class MovieDetailEvent extends Equatable {
  const MovieDetailEvent();
}

class GetMovieDetailEvent extends MovieDetailEvent {
  final int movieID;
  const GetMovieDetailEvent({
    required this.movieID,
  });
  

  @override
  List<Object> get props => [movieID];
}
