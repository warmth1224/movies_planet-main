import 'package:movies_planet/data/model/mp_media.dart';

class MPWatchListModel extends MpMedia {
  const MPWatchListModel(
      {required super.tmdbID,
      required super.title,
      required super.posterUrl,
      required super.backdropUrl,
      required super.averageVote,
      required super.releaseDate,
      required super.overview,
      required super.isMovie});

  factory MPWatchListModel.fromMpMedia(MpMedia media) {
    return MPWatchListModel(
        tmdbID: media.tmdbID,
        title: media.title,
        posterUrl: media.posterUrl,
        backdropUrl: media.backdropUrl,
        averageVote: media.averageVote,
        releaseDate: media.releaseDate,
        overview: media.overview,
        isMovie: media.isMovie);
  }
}
