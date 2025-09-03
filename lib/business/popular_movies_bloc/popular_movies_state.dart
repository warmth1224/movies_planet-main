part of 'popular_movies_bloc.dart';


class PopularMoviesState extends Equatable {
  const PopularMoviesState(
      {this.movies = const [],
      this.requestStatus = FetchRequestStatus.loading,
      this.message = '',
      });
  final List<MpMedia> movies;
  final FetchRequestStatus requestStatus;
  final String message;


  @override
  List<Object> get props => [movies, requestStatus, message,];

  PopularMoviesState copyWith({
    List<MpMedia>? movies,
    FetchRequestStatus? requestStatus,
    String? message,
 
  }) {
    return PopularMoviesState(
        movies: movies ?? this.movies,
        requestStatus: requestStatus ?? this.requestStatus,
        message: message ?? this.message,
        );
  }
}
