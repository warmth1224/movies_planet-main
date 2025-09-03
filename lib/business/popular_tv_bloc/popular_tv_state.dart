// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'popular_tv_bloc.dart';

class PopularTvState extends Equatable {
  const PopularTvState({
    this.tvShows = const [],
      this.status = FetchRequestStatus.loading,
      this.message = ''
  });
   final List<MpMedia> tvShows;
  final FetchRequestStatus status;
  final String message;

  @override
  List<Object> get props => [tvShows,status,message];

  PopularTvState copyWith({
    List<MpMedia>? tvShows,
    FetchRequestStatus? status,
    String? message,
  }) {
    return PopularTvState(
      tvShows: tvShows ?? this.tvShows,
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }
}

