import 'package:movies_planet/data/model/mp_search.dart';

import '../../../utils/mp_functions.dart';

class SearchModel extends MpSearch {
  const SearchModel(
      {required super.tmdbID,
      required super.posterUrl,
      required super.title,
      required super.isMovie});
  factory SearchModel.fromMap(Map<String, dynamic> map) {
    return SearchModel(
      tmdbID: map['id'],
      posterUrl: getPosterUrl(map['poster_path']),
      title: map['title'] ?? map['name'],
      isMovie: map['media_type'] == 'movie',
    );
  }
}
