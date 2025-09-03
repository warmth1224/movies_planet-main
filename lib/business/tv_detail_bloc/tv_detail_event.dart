part of 'tv_detail_bloc.dart';

abstract class TvDetailEvent extends Equatable {
  const TvDetailEvent();

  @override
  List<Object> get props => [];
}

class ShowDetailEvent extends TvDetailEvent {
  const ShowDetailEvent({
    required this.id,
  });
  final int id;

  @override
  List<Object> get props => [id];
}

class SeasonDetailEvent extends TvDetailEvent {
  const SeasonDetailEvent({required this.id, required this.season});
  final int id;
  final int season;

  @override
  List<Object> get props => [id, season];
}
