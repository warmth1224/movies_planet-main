part of 'tv_detail_bloc.dart';

class TvDetailState extends Equatable {
  const TvDetailState(
      {this.showDetail,
      this.showRequestStatus = RequestStatus.loading,
      this.showDetailsMessage = '',
      this.seasonDetail,
      this.seasonRequestStatus = RequestStatus.loading,
      this.seasonDetailsMessage = ''});
  final MpMediaDetails? showDetail;
  final RequestStatus showRequestStatus;
  final String showDetailsMessage;
  final MPSeasonDetails? seasonDetail;
  final RequestStatus seasonRequestStatus;
  final String seasonDetailsMessage;

  @override
  List<Object?> get props {
    return [
      showDetail,
      showRequestStatus,
      showDetailsMessage,
      seasonDetail,
      seasonRequestStatus,
      seasonDetailsMessage,
    ];
  }

  TvDetailState copyWith({
    MpMediaDetails? showDetail,
    RequestStatus? showRequestStatus,
    String? showDetailsMessage,
    MPSeasonDetails? seasonDetail,
    RequestStatus? seasonRequestStatus,
    String? seasonDetailsMessage,
  }) {
    return TvDetailState(
      showDetail: showDetail ?? this.showDetail,
      showRequestStatus: showRequestStatus ?? this.showRequestStatus,
      showDetailsMessage: showDetailsMessage ?? this.showDetailsMessage,
      seasonDetail: seasonDetail ?? this.seasonDetail,
      seasonRequestStatus: seasonRequestStatus ?? this.seasonRequestStatus,
      seasonDetailsMessage: seasonDetailsMessage ?? this.seasonDetailsMessage,
    );
  }
}
