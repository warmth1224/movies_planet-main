part of 'popular_movies_bloc.dart';

abstract class PopularMoviesEvent extends Equatable {
  const PopularMoviesEvent();

  @override
  List<Object> get props => [];
}

class FetchPopularMoviesEvent extends PopularMoviesEvent {}

class FetchMorePopularMoviesEvent extends PopularMoviesEvent {}
