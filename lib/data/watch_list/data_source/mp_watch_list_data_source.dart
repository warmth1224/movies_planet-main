import 'package:hive_flutter/hive_flutter.dart';
import 'package:movies_planet/data/watch_list/models/watch_list_model.dart';

abstract class MPWatchListDataSource {
  Future<List<MPWatchListModel>> getWatchListItems();
  Future<int> addItem(MPWatchListModel item);
  Future<void> removeItem(int index);
  Future<int> checkForDuplicate(int tmdbId);
}

class MPWatchListDataSourceImplementation extends MPWatchListDataSource {
  final Box _box = Hive.box('items');

  @override
  Future<int> addItem(MPWatchListModel item) async {
    return await _box.add(item);
  }

  @override
  Future<int> checkForDuplicate(int tmdbId) async {
    return _box.values
        .toList()
        .indexWhere((element) => element.tmdbID == tmdbId);
  }

  @override
  Future<List<MPWatchListModel>> getWatchListItems() async {
    return _box.values
        .map((e) => MPWatchListModel.fromMpMedia(e))
        .toList()
        .reversed
        .toList();
  }

  @override
  Future<void> removeItem(int index) async {
    return await _box.delete(index);
  }
}
