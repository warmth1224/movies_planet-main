part of 'tv_bloc_bloc.dart';

abstract class TvBlocEvent extends Equatable {
  const TvBlocEvent();

  @override
  List<Object> get props => [];
}
class GetTvBlocEvent extends TvBlocEvent{}
