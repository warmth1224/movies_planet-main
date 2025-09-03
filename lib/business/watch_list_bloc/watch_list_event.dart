part of 'watch_list_bloc.dart';

abstract class WatchListEvent extends Equatable {
  const WatchListEvent();
}

class GetWatchListItemsEvent extends WatchListEvent {
  @override
  List<Object?> get props => [];
}

class AddWatchListItemsEvent extends WatchListEvent {
  final MpMedia media;
  const AddWatchListItemsEvent({
    required this.media,
  });

  @override
  List<Object> get props => [media];
}

class RemoveWatchListItemsEvent extends WatchListEvent {
  final int index;
  const RemoveWatchListItemsEvent({
    required this.index,
  });

  @override
  List<Object> get props => [index];
}

class CheckItemAddedEvent extends WatchListEvent {
  final int tmdbId;

  const CheckItemAddedEvent(this.tmdbId);

  @override
  List<Object> get props => [tmdbId];
}
