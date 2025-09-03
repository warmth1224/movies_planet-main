import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_planet/data/watch_list/use_case/add_watch_list_items_usecase.dart';
import 'package:movies_planet/data/watch_list/use_case/check_item_use_case.dart';
import 'package:movies_planet/data/watch_list/use_case/get_watch_list_items_usecase.dart';
import 'package:movies_planet/data/watch_list/use_case/remove_watch_list_items_use_case.dart';
import 'package:movies_planet/data/usecase/mp_use_case.dart';

import '../../data/model/mp_media.dart';

part 'watch_list_event.dart';
part 'watch_list_state.dart';

class WatchListBloc extends Bloc<WatchListEvent, WatchListState> {
  WatchListBloc(
    this._getWatchListItemsUseCase,
    this._addWatchListItemsUseCase,
    this._removeWatchListItemsUseCase,
    this._checkItemAddedUseCase,
  ) : super(const WatchListState()) {
    on<GetWatchListItemsEvent>(_getWatchListItems);
    on<AddWatchListItemsEvent>(_addWatchListItems);
    on<RemoveWatchListItemsEvent>(_removeWatchListItems);
    on<CheckItemAddedEvent>(_checkItemAdded);
  }
  final GetWatchListItemsUseCase _getWatchListItemsUseCase;
  final AddWatchListItemsUseCase _addWatchListItemsUseCase;
  final RemoveWatchListItemsUseCase _removeWatchListItemsUseCase;
  final CheckItemAddedUseCase _checkItemAddedUseCase;

  FutureOr<void> _getWatchListItems(
      WatchListEvent event, Emitter<WatchListState> emit) async {
    emit(
      const WatchListState(status: WatchListRequestStatus.loading),
    );
    final result = await _getWatchListItemsUseCase.call(const NoParameters());
    result.fold(
        (l) => emit(WatchListState(
            status: WatchListRequestStatus.error, message: l.message)), (r) {
      if (r.isEmpty) {
        emit(const WatchListState(status: WatchListRequestStatus.empty));
      } else {
        emit(WatchListState(status: WatchListRequestStatus.loaded, items: r));
      }
    });
  }

  FutureOr<void> _addWatchListItems(
      AddWatchListItemsEvent event, Emitter<WatchListState> emit) async {
    emit(
      const WatchListState(status: WatchListRequestStatus.loading),
    );
    final result = await _addWatchListItemsUseCase.call(event.media);
    result.fold(
      (l) => emit(WatchListState(
          status: WatchListRequestStatus.error, message: l.message)),
      (r) => emit(
        WatchListState(status: WatchListRequestStatus.itemAdded, id: r),
      ),
    );
  }

  FutureOr<void> _removeWatchListItems(
      RemoveWatchListItemsEvent event, Emitter<WatchListState> emit) async {
    emit(
      const WatchListState(status: WatchListRequestStatus.loading),
    );
    final result = await _removeWatchListItemsUseCase.call(event.index);
    result.fold(
      (l) => emit(WatchListState(
          status: WatchListRequestStatus.error, message: l.message)),
      (r) => emit(const WatchListState(
        status: WatchListRequestStatus.itemRemoved,
      )),
    );
  }

  FutureOr<void> _checkItemAdded(
      CheckItemAddedEvent event, Emitter<WatchListState> emit) async {
    emit(
      const WatchListState(status: WatchListRequestStatus.loading),
    );
    final result = await _checkItemAddedUseCase.call(event.tmdbId);
    result.fold(
      (l) => emit(
        WatchListState(
            status: WatchListRequestStatus.error, message: l.message),
      ),
      (r) => emit(
        WatchListState(status: WatchListRequestStatus.isItemAdded, id: r),
      ),
    );
  }
}
