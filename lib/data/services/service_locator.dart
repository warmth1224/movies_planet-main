import 'package:get_it/get_it.dart';
import 'package:movies_planet/business/movies_bloc/movies_bloc.dart';
import 'package:movies_planet/business/popular_movies_bloc/popular_movies_bloc.dart';
import 'package:movies_planet/business/top_rated_movies_bloc/top_rated_movies_bloc.dart';
import 'package:movies_planet/business/tv_bloc/tv_bloc_bloc.dart';
import 'package:movies_planet/business/tv_detail_bloc/tv_detail_bloc.dart';
import 'package:movies_planet/business/watch_list_bloc/watch_list_bloc.dart';
import 'package:movies_planet/data/movies/data_source/mp_movie_data_source_implement.dart';
import 'package:movies_planet/data/movies/data_source/mp_remote_data_source.dart';
import 'package:movies_planet/data/movies/usecase/mp_popular_movies_usecase.dart';
import 'package:movies_planet/data/repositories/mp_movies_repository.dart';
import 'package:movies_planet/data/movies/repository/mp_movies_repository_imp.dart';
import 'package:movies_planet/data/movies/usecase/mp_movie_details_usecase.dart';
import 'package:movies_planet/data/movies/usecase/mp_movies_use_case.dart';
import 'package:movies_planet/data/repositories/mp_search_repository.dart';
import 'package:movies_planet/data/repositories/mp_tv_repository.dart';
import 'package:movies_planet/data/search/data_source/mp_search_data_source.dart';
import 'package:movies_planet/data/search/data_source/search_data_source_implementation.dart';
import 'package:movies_planet/data/search/repo/search_repository_implelentation.dart';
import 'package:movies_planet/data/search/usecase/mp_search_use_case.dart';
import 'package:movies_planet/data/tv_shows/data_source/mp_tv_show_remote_data_source.dart';
import 'package:movies_planet/data/tv_shows/data_source/mp_tv_show_remote_data_source_implementation.dart';
import 'package:movies_planet/data/tv_shows/repo/tv_repository_implementation.dart';
import 'package:movies_planet/data/tv_shows/usecase/mp_popular_tv_shows_usecase.dart';
import 'package:movies_planet/data/tv_shows/usecase/mp_top_rated_tv_shows_usecase.dart';
import 'package:movies_planet/data/tv_shows/usecase/mp_tv_season_detail_usecase.dart';
import 'package:movies_planet/data/tv_shows/usecase/mp_tv_shows_details_usecase.dart';
import 'package:movies_planet/data/tv_shows/usecase/mp_tv_shows_usecase.dart';
import 'package:movies_planet/data/watch_list/data_source/mp_watch_list_data_source.dart';
import 'package:movies_planet/data/repositories/mp_watch_list_repository.dart';
import 'package:movies_planet/data/watch_list/repository/watch_list_repository_implementation.dart';
import 'package:movies_planet/data/watch_list/use_case/add_watch_list_items_usecase.dart';

import '../../business/movies_detail_bloc/movies_detail_bloc.dart';
import '../../business/popular_tv_bloc/popular_tv_bloc.dart';
import '../../business/search_bloc/search_bloc.dart';
import '../../business/top_rated_tv_bloc/top_rated_tv_bloc.dart';
import '../movies/usecase/mp_top_rated_movies_usecase.dart';
import '../watch_list/use_case/check_item_use_case.dart';
import '../watch_list/use_case/get_watch_list_items_usecase.dart';
import '../watch_list/use_case/remove_watch_list_items_use_case.dart';

final serviceLocator = GetIt.instance;

class ServiceLocator {
  static void init() {
    // data source
    serviceLocator.registerLazySingleton<MpRemoteDataSource>(
        () => MpMoviesDataSourceImplement());
    serviceLocator.registerLazySingleton<MPWatchListDataSource>(
        () => MPWatchListDataSourceImplementation());
    serviceLocator.registerLazySingleton<MPTvShowsRemoteDataSource>(
        () => MPTvShowsRemoteDataSourceImplementation());
    serviceLocator.registerLazySingleton<MpSearchDataSource>(
        () => SearchDataSourceImplementation());
    // repository
    serviceLocator.registerLazySingleton<MPMoviesRepository>(
        () => MpMoviesRepositoryImplement(serviceLocator()));
    serviceLocator.registerLazySingleton<MPWatchListRepository>(
        () => WatchListRepositoryImplementation(serviceLocator()));
    serviceLocator.registerLazySingleton<MPTvRepository>(
        () => TvRepositoryImplementation(serviceLocator()));

    serviceLocator.registerLazySingleton<MpSearchRepository>(
        () => SearchRepositoryImplementation(serviceLocator()));
    // use case

    serviceLocator.registerLazySingleton(() => MoviesUseCase(serviceLocator()));
    serviceLocator
        .registerLazySingleton(() => MPMoviesDetailUseCase(serviceLocator()));
    serviceLocator.registerLazySingleton(
        () => AddWatchListItemsUseCase(serviceLocator()));
    serviceLocator
        .registerLazySingleton(() => MpPopularMoviesUseCase(serviceLocator()));
    serviceLocator.registerLazySingleton(
        () => GetWatchListItemsUseCase(serviceLocator()));
    serviceLocator.registerLazySingleton(
        () => RemoveWatchListItemsUseCase(serviceLocator()));
    serviceLocator
        .registerLazySingleton(() => CheckItemAddedUseCase(serviceLocator()));
    serviceLocator
        .registerLazySingleton(() => GetTvShowsUseCase(serviceLocator()));
    serviceLocator
        .registerLazySingleton(() => GetTvShowsDetailUseCase(serviceLocator()));
            serviceLocator
        .registerLazySingleton(() => GetPopularTVShowsUseCase(serviceLocator()));
            serviceLocator
        .registerLazySingleton(() => GetTopRatedTVShowsUseCase(serviceLocator()));

    serviceLocator.registerLazySingleton(
        () => GetTvSeasonDetailUseCase(serviceLocator()));
    serviceLocator
        .registerLazySingleton(() => MpSearchUseCase(serviceLocator()));
    serviceLocator
        .registerLazySingleton(() => MpTopRatedMoviesUseCase(serviceLocator()));

    // Bloc

    serviceLocator.registerFactory(() => MoviesBloc(serviceLocator()));
    serviceLocator.registerFactory(() => MovieDetailBloc(serviceLocator()));
    serviceLocator.registerFactory(() => WatchListBloc(serviceLocator(),
        serviceLocator(), serviceLocator(), serviceLocator()));
    serviceLocator.registerFactory(() => TvBloc(serviceLocator()));
    serviceLocator.registerFactory(
        () => TvDetailBloc(serviceLocator(), serviceLocator()));
    serviceLocator.registerFactory(() => SearchBloc(serviceLocator()));
    serviceLocator.registerFactory(() => PopularMoviesBloc(serviceLocator()));
    serviceLocator.registerFactory(() => TopRatedMoviesBloc(serviceLocator()));
     serviceLocator.registerFactory(() => PopularTvBloc(serviceLocator()));
      serviceLocator.registerFactory(() => TopRatedTvBloc(serviceLocator()));
  }
}
