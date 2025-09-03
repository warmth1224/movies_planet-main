
part of 'watch_list_bloc.dart';

enum WatchListRequestStatus {
  empty,
  loading,
  loaded,
  error,
  itemAdded,
  itemRemoved,
  isItemAdded,
}

class WatchListState extends Equatable {
  const WatchListState({
    this.id,
    this.items = const [],
    this.status = WatchListRequestStatus.loading,
    this.message = '',
  });
  final int? id;
  final List<MpMedia> items;
  final WatchListRequestStatus status;
  final String message;

  @override
  List<Object?> get props => [id, items, status, message];

  WatchListState copyWith({
    int? id,
    List<MpMedia>? items,
    WatchListRequestStatus? status,
    String? message,
  }) {
    return WatchListState(
      id: id ?? this.id,
      items: items ?? this.items,
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }
}


