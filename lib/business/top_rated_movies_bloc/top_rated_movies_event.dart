part of 'top_rated_movies_bloc.dart';

abstract class TopRatedMoviesEvent extends Equatable {
  const TopRatedMoviesEvent();

  @override
  List<Object> get props => [];
}

class FetchTopRatedMoviesEvent extends TopRatedMoviesEvent {}

class FetchMoreTopRatedMoviesEvent extends TopRatedMoviesEvent {}