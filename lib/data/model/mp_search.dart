import 'package:equatable/equatable.dart';

class MpSearch extends Equatable {
  final int tmdbID;
  final String posterUrl;
  final String title;
  final bool isMovie;

  const MpSearch({
    required this.tmdbID,
    required this.posterUrl,
    required this.title,
    required this.isMovie,
  });

  @override
  List<Object?> get props => [
        tmdbID,
        posterUrl,
        title,
        isMovie,
      ];
}
