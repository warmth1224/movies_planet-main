import 'package:movies_planet/data/search/model/search_model.dart';

abstract class MpSearchDataSource {
  Future<List<SearchModel>> search(String query);
}
