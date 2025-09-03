import 'package:equatable/equatable.dart';
import 'package:movies_planet/data/model/mp_media.dart';
import 'package:movies_planet/data/model/mp_cast.dart';
import 'package:movies_planet/data/model/mp_review.dart';
import 'package:movies_planet/data/model/mp_episode.dart';
import 'package:movies_planet/data/model/mp_season.dart';

// ignore: must_be_immutable
class MpMediaDetails extends Equatable {
  int? id;
  final int tmdbID;
  final String title;
  final String posterUrl;
  final String backdropUrl;
  final String releaseDate;
  final MPEpisode? lastEpisodeToAir;
  final String genres;
  final String? runtime;
  final int? numberOfSeasons;
  final String overview;
  final double averageVote;
  final String voteCount;
  final String trailerUrl;
  final List<MpCast>? cast;
  final List<MpReview>? reviews;
  final List<MPSeason>? seasons;
  final List<MpMedia> similar;
  bool isAdded;
  
 MpMediaDetails({
    this.id,
    required this.tmdbID,
    required this.title,
    required this.posterUrl,
    required this.backdropUrl,
    required this.releaseDate,
    this.lastEpisodeToAir,
    required this.genres,
    this.runtime,
    this.numberOfSeasons,
    required this.overview,
    required this.averageVote,
    required this.voteCount,
    required this.trailerUrl,
    this.cast,
    this.reviews,
    this.seasons,
    required this.similar,
    this.isAdded = false,
  });

  @override
  List<Object?> get props {
    return [
      id,
      tmdbID,
      title,
      posterUrl,
      backdropUrl,
      releaseDate,
      genres,
      overview,
      averageVote,
      voteCount,
      trailerUrl,
      similar,
      isAdded,
    ];
  }
}
