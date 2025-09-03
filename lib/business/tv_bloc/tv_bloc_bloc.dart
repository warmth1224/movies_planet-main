import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_planet/data/model/mp_media.dart';
import 'package:movies_planet/data/tv_shows/usecase/mp_tv_shows_usecase.dart';
import 'package:movies_planet/data/usecase/mp_use_case.dart';
import 'package:movies_planet/utils/enums.dart';

part 'tv_bloc_event.dart';
part 'tv_bloc_state.dart';

class TvBloc extends Bloc<TvBlocEvent, TvBlocState> {
  final GetTvShowsUseCase _tvShowsUseCase;
  TvBloc(this._tvShowsUseCase) : super(const TvBlocState()) {
    on<TvBlocEvent>(_getTvShows);
  }

  FutureOr<void> _getTvShows(
      TvBlocEvent event, Emitter<TvBlocState> emit) async {
    emit(
      const TvBlocState(status: RequestStatus.loading),
    );
    final result = await _tvShowsUseCase(const NoParameters());
    result.fold(
      (l) => emit(const TvBlocState(status: RequestStatus.error)),
      (r) => emit(
        TvBlocState(status: RequestStatus.loaded, tvShows: r),
      ),
    );
  }
}
