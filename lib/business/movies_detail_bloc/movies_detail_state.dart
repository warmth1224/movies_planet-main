import 'package:movies_planet/data/model/mp_media_details.dart';
import 'package:movies_planet/utils/enums.dart';

class MovieDetailState {
  MovieDetailState(
      {this.mediaDetails,
      this.status = RequestStatus.loading,
      this.message = ''});
  final MpMediaDetails? mediaDetails;
  final RequestStatus status;
  final String message;

  MovieDetailState copyWith({
    MpMediaDetails? mediaDetails,
    RequestStatus? status,
    String? message,
  }) {
    return MovieDetailState(
      mediaDetails: mediaDetails ?? this.mediaDetails,
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }
}
