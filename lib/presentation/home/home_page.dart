import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_planet/resources/mp_colors.dart';
import 'package:movies_planet/resources/mp_routes.dart';
import 'package:movies_planet/resources/mp_strings.dart';
import 'package:movies_planet/resources/mp_values.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.child});
  final Widget child;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          final String matchedLocation =
              GoRouterState.of(context).matchedLocation;
          if (!matchedLocation.startsWith(MPRoutesPath.moviesPath)) {
            _onTapItem(0, context);
          }
          return true;
        },
        child: widget.child,
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: MPColors.primaryBackground,
        color: MPColors.secondaryBackground,
        buttonBackgroundColor: MPColors.primary,
        items: const [
          CurvedNavigationBarItem(
            label: MPStrings.movies,
            child: Icon(
              Icons.movie_creation_sharp,
              size:MPSize.size20,
              color: MPColors.primaryBtnText,
            ),
          ),
          CurvedNavigationBarItem(
            label: MPStrings.shows,
            child: Icon(
              Icons.tv_sharp,
              size:MPSize.size20,
              color: MPColors.primaryBtnText,
            ),
          ),
          CurvedNavigationBarItem(
            label: MPStrings.search,
            child: Icon(
              Icons.search_sharp,
              size:MPSize.size20,
              color: MPColors.primaryBtnText,
            ),
          ),
          CurvedNavigationBarItem(
            label: MPStrings.watchList,
            child: Icon(
              Icons.bookmark_sharp,
              size:MPSize.size20,
              color: MPColors.primaryBtnText,
            ),
          ),
        ],
        index: _selectedIndex(context),
        onTap: (value) => _onTapItem(value, context),
      ),
    );
  }

  void _onTapItem(int i, BuildContext context) {
    switch (i) {
      case 0:
        context.goNamed(MPRoutes.moviesRoute);
        break;
      case 1:
        context.goNamed(MPRoutes.tvShowsRoute);
        break;
      case 2:
        context.goNamed(MPRoutes.searchRoute);
        break;
      case 3:
        context.goNamed(MPRoutes.watchListRoute);
        break;
      default:
        context.goNamed(MPRoutes.moviesRoute);
    }
  }

  int _selectedIndex(BuildContext context) {
    final String matchedLocation = GoRouterState.of(context).matchedLocation;
    if (matchedLocation.startsWith(MPRoutesPath.moviesPath)) {
      return 0;
    }
    if (matchedLocation.startsWith(MPRoutesPath.tvShowsPath)) {
      return 1;
    }
    if (matchedLocation.startsWith(MPRoutesPath.searchPath)) {
      return 2;
    }
    if (matchedLocation.startsWith(MPRoutesPath.watchListPath)) {
      return 3;
    }
    return 0;
  }
}
