import 'package:dio/dio.dart';
import 'package:movies_planet/data/errors/exceptions.dart';
import 'package:movies_planet/data/model/error_message_model.dart';
import 'package:movies_planet/data/network/api_constants.dart';
import 'package:movies_planet/data/search/model/search_model.dart';
import 'mp_search_data_source.dart';

class SearchDataSourceImplementation implements MpSearchDataSource {
  @override
  Future<List<SearchModel>> search(String query) async {
    final result = await Dio().get(MpApi.getSearchPath(query));
    if (result.statusCode == 200) {
      return List<SearchModel>.from((result.data['results'] as List)
          .where((element) => element['media_type'] != 'person')
          .map((e) => SearchModel.fromMap(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromMap(result.data));
    }
  }
}
