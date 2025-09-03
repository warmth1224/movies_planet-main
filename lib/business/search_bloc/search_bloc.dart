import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_planet/data/model/mp_search.dart';
import 'package:movies_planet/data/search/usecase/mp_search_use_case.dart';
import 'package:stream_transform/stream_transform.dart';
part 'search_event.dart';
part 'search_state.dart';

const _duration = Duration(milliseconds: 600);

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final MpSearchUseCase _searchUseCase;
  SearchBloc(this._searchUseCase) : super(const SearchState()) {
    on<GetSearchEvent>(_search, transformer: debounce(_duration));
  }

  FutureOr<void> _search(
      GetSearchEvent event, Emitter<SearchState> emit) async {
    
    emit(
      state.copyWith(
        status: SearchStatus.loading,
      ),
    );
    final result = await _searchUseCase(event.query);
   
    result.fold(
        (l) => emit(
              state.copyWith(status: SearchStatus.error, message: l.message),
            ),
        (r) => emit(
              state.copyWith(status: SearchStatus.loaded, searchResults: r),
            ));
  }
}

EventTransformer<Event> debounce<Event>(Duration duration) {
  return (events, mapper) => events.debounce(duration).switchMap(mapper);
}
