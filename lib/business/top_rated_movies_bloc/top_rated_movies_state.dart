part of 'top_rated_movies_bloc.dart';

class TopRatedMoviesState extends Equatable {
  const TopRatedMoviesState({
    this.movies = const [],
    this.status = FetchRequestStatus.loading,
    this.message = '',
  });
  final List<MpMedia> movies;
  final FetchRequestStatus status;
  final String message;

  @override
  List<Object> get props => [movies, status, message];

  TopRatedMoviesState copyWith({
    List<MpMedia>? movies,
    FetchRequestStatus? status,
    String? message,
  }) {
    return TopRatedMoviesState(
      movies: movies ?? this.movies,
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }
}
