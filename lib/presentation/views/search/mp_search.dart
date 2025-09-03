import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_planet/business/search_bloc/search_bloc.dart';
import 'package:movies_planet/data/services/service_locator.dart';
import 'package:movies_planet/presentation/widgets/mp_error_text.dart';
import 'package:movies_planet/presentation/widgets/mp_loader.dart';
import 'package:movies_planet/resources/mp_values.dart';

import '../../widgets/mp_search_bar.dart';
import '../../widgets/mp_search_grid_view.dart';
import '../../widgets/mp_search_text.dart';
import '../../widgets/no_results.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => serviceLocator<SearchBloc>(),
      child: const SearchWidget(),
    );
  }
}

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
            top: MPPadding.padding12,
            left: MPPadding.padding16,
            right: MPPadding.padding16),
        child: Column(
          children: [
            const MpSearchBar(),
            BlocBuilder<SearchBloc,SearchState>(builder: (context,state){
                  switch (state.status) {
                    case SearchStatus.empty:
                      return const MpSearchText();
                    case SearchStatus.loading:
                      return const Expanded(child: MPLoader());
                    case SearchStatus.loaded:
                      return MpGridView(results: state.searchResults);
                    case SearchStatus.error:
                      return const Expanded(child: MpErrorText());
                    case SearchStatus.noResults:
                      return const NoResults();
                  }
            },)
          ],
        ),
      ),
    ));
  }
}
