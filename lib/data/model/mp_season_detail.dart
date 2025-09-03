
import 'package:equatable/equatable.dart';

import 'mp_episode.dart';

class MPSeasonDetails extends Equatable {
  const MPSeasonDetails({
    required this.mpEpisodes,
  });

  final List<MPEpisode> mpEpisodes;

  @override
  List<Object?> get props => [
        mpEpisodes,
      ];
}