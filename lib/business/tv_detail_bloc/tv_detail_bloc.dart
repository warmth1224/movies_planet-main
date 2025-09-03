import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_planet/data/model/mp_media_details.dart';
import 'package:movies_planet/data/model/mp_season_detail.dart';
import 'package:movies_planet/data/tv_shows/usecase/mp_tv_season_detail_usecase.dart';
import 'package:movies_planet/data/tv_shows/usecase/mp_tv_shows_details_usecase.dart';
import 'package:movies_planet/resources/mp_season_detail_params.dart';
import 'package:movies_planet/utils/enums.dart';

part 'tv_detail_event.dart';
part 'tv_detail_state.dart';

class TvDetailBloc extends Bloc<TvDetailEvent, TvDetailState> {
  TvDetailBloc(this._showsDetailUseCase, this._seasonDetailUseCase)
      : super(const TvDetailState()) {
    on<ShowDetailEvent>(_getTvShowDetails);
    on<SeasonDetailEvent>(getSeasonDetail);
  }
  final GetTvShowsDetailUseCase _showsDetailUseCase;
  final GetTvSeasonDetailUseCase _seasonDetailUseCase;

  FutureOr<void> getSeasonDetail(
      SeasonDetailEvent event, Emitter<TvDetailState> emit) async {
    emit(
      state.copyWith(seasonRequestStatus: RequestStatus.loading),
    );
    final result = await _seasonDetailUseCase(
        MPSeasonDetailParams(event.id, event.season));
    result.fold(
      (l) => emit(state.copyWith(
          seasonRequestStatus: RequestStatus.error,
          seasonDetailsMessage: l.message)),
      (r) => emit(state.copyWith(
          seasonRequestStatus: RequestStatus.loaded, seasonDetail: r)),
    );
  }

  Future<void> _getTvShowDetails(
      ShowDetailEvent event, Emitter<TvDetailState> emit) async {
    emit(
      state.copyWith(
        showRequestStatus: RequestStatus.loading,
      ),
    );
    final result = await _showsDetailUseCase(event.id);

    result.fold(
      (l) => emit(
        TvDetailState(
          showRequestStatus: RequestStatus.error,
          showDetailsMessage: l.message,
        ),
      ),
      (r) => emit(
        TvDetailState(
          showRequestStatus: RequestStatus.loaded,
          showDetail: r,
        ),
      ),
    );
  }
}
