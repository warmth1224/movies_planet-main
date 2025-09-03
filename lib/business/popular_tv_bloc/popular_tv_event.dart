part of 'popular_tv_bloc.dart';

abstract class PopularTvEvent extends Equatable {
  const PopularTvEvent();

  @override
  List<Object> get props => [];
}
class FetchPopularTvShowsEvent extends PopularTvEvent {}

class FetchMorePopularTvShowsEvent extends PopularTvEvent {}