import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_planet/presentation/views/search/mp_search.dart';
import 'package:movies_planet/presentation/views/tv/popular_shows_view.dart';
import 'package:movies_planet/presentation/views/tv/top_rated_show_view.dart';
import 'package:movies_planet/presentation/views/tv/tv_details_view.dart';
import 'package:movies_planet/resources/mp_routes.dart';

import '../presentation/home/home_page.dart';
import '../presentation/views/movies/movie_details_view.dart';
import '../presentation/views/movies/movies_view.dart';
import '../presentation/views/movies/popular_movies_view.dart';
import '../presentation/views/movies/top_rated_movies_view.dart';
import '../presentation/views/tv/tv_shows_view.dart';
import '../presentation/views/watchlist/watch_list_view.dart';

class MPRouter {
  GoRouter router = GoRouter(initialLocation: MPRoutesPath.moviesPath, routes: [
    ShellRoute(
      builder: (context, state, child) => HomePage(child: child),
      routes: [
        GoRoute(
          path: MPRoutesPath.moviesPath,
          name: MPRoutes.moviesRoute,
          pageBuilder: (context, state) => const NoTransitionPage(
            child: MoviesView(),
          ),
          routes: [
            GoRoute(
              path: MPRoutesPath.movieDetailsPath,
              name: MPRoutes.movieDetailsRoute,
              pageBuilder: (context, state) => CupertinoPage(
                child: MovieDetailsView(
                  movieID: int.parse(state.pathParameters['movieId']!),
                ),
              ),
            ),
            GoRoute(
              path: MPRoutesPath.popularMoviesPath,
              name: MPRoutes.popularMoviesRoute,
              pageBuilder: (context, state) => const CupertinoPage(
                child: PopularMoviesView(),
              ),
            ),
            GoRoute(
              path: MPRoutesPath.topRatedMoviesPath,
              name: MPRoutes.topRatedMoviesRoute,
              pageBuilder: (context, state) => const CupertinoPage(
                child: TopRatedMoviesView(),
              ),
            ),
          ],
        ),
        GoRoute(
          path: MPRoutesPath.tvShowsPath,
          name: MPRoutes.tvShowsRoute,
          pageBuilder: (context, state) => const NoTransitionPage(
            child: TvShowsView(),
          ),
          routes: [
            GoRoute(
              path: MPRoutesPath.tvShowDetailsPath,
              name: MPRoutes.tvShowDetailsRoute,
              pageBuilder: (context, state) => CupertinoPage(
                child: TVDetailsView(
                  tvShowID: int.parse(state.pathParameters["tvShowId"]!),
                ),
              ),
            ),
            GoRoute(
              path: MPRoutesPath.popularTVShowsPath,
              name: MPRoutes.popularTvShowsRoute,
              pageBuilder: (context, state) => const CupertinoPage(
                child: PopularShowsView(),
              ),
            ),
            GoRoute(
              path: MPRoutesPath.topRatedTVShowsPath,
              name: MPRoutes.topRatedTvShowsRoute,
              pageBuilder: (context, state) => const CupertinoPage(
                child: TopRatedShowsView(),
              ),
            ),
          ],
        ),
        GoRoute(
          path: MPRoutesPath.searchPath,
          name: MPRoutes.searchRoute,
          pageBuilder: (context, state) => const NoTransitionPage(
            child: SearchView(),
          ),
        ),
        GoRoute(
          path: MPRoutesPath.watchListPath,
          name: MPRoutes.watchListRoute,
          pageBuilder: (context, state) => const NoTransitionPage(
            child: WatchListView(),
          ),
        ),
      ],
    ),
  ]);
}
