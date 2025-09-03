// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'mp_media_details.dart';

part 'mp_media.g.dart';

@HiveType(typeId: 1)
class MpMedia extends Equatable {
  @HiveField(0)
  final int tmdbID;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String posterUrl;
  @HiveField(3)
  final String backdropUrl;
  @HiveField(4)
  final double averageVote;
  @HiveField(5)
  final String releaseDate;
  @HiveField(6)
  final String overview;
  @HiveField(7)
  final bool isMovie;
  const MpMedia({
    required this.tmdbID,
    required this.title,
    required this.posterUrl,
    required this.backdropUrl,
    required this.averageVote,
    required this.releaseDate,
    required this.overview,
    required this.isMovie,
  });
  factory MpMedia.fromMpMediaDetails(MpMediaDetails mpMediaDetails) {
    return MpMedia(
        tmdbID: mpMediaDetails.tmdbID,
        title: mpMediaDetails.title,
        posterUrl: mpMediaDetails.posterUrl,
        backdropUrl: mpMediaDetails.backdropUrl,
        averageVote: mpMediaDetails.averageVote,
        releaseDate: mpMediaDetails.releaseDate,
        overview: mpMediaDetails.overview,
        isMovie: mpMediaDetails.lastEpisodeToAir == null,);
  }
  @override
  List<Object> get props {
    return [
      tmdbID,
      title,
      posterUrl,
      backdropUrl,
      averageVote,
      releaseDate,
      overview,
      isMovie,
    ];
  }
}
