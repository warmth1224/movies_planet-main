part of 'tv_bloc_bloc.dart';

class TvBlocState extends Equatable {
  const TvBlocState({
    this.tvShows = const [],
    this.status = RequestStatus.loading,
    this.message = '',
  });
  final List<List<MpMedia>> tvShows;
  final RequestStatus status;
  final String message;

  @override
  List<Object> get props => [tvShows, status, message];
}
