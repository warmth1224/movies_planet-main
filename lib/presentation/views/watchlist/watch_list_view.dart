// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movies_planet/business/watch_list_bloc/watch_list_bloc.dart';
import 'package:movies_planet/data/model/mp_media.dart';
import 'package:movies_planet/data/services/service_locator.dart';
import 'package:movies_planet/presentation/widgets/mp_app_bar.dart';
import 'package:movies_planet/presentation/widgets/mp_error_widget.dart';
import 'package:movies_planet/presentation/widgets/mp_loader.dart';
import 'package:movies_planet/presentation/widgets/mp_vertical_list_view.dart';
import 'package:movies_planet/resources/mp_strings.dart';
import 'package:movies_planet/resources/mp_values.dart';

class WatchListView extends StatelessWidget {
  const WatchListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          serviceLocator<WatchListBloc>()..add(GetWatchListItemsEvent()),
      child: Scaffold(
        appBar: const MPAppBar(title: MPStrings.watchList),
        body: BlocBuilder<WatchListBloc, WatchListState>(
          builder: (context, state) {
            if (state.status == WatchListRequestStatus.loading) {
              return const MPLoader();
            } else if (state.status == WatchListRequestStatus.loaded) {
              return _WatchListWidget(items: state.items);
            } else if (state.status == WatchListRequestStatus.empty) {
              return _EmptyWatchList();
            } else {
              return MPErrorWidget(
                  onTryAgainTap: () => context
                      .read<WatchListBloc>()
                      .add(GetWatchListItemsEvent()));
            }
          },
        ),
      ),
    );
  }
}

class _EmptyWatchList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          MPStrings.watchListIsEmpty,
          style: textTheme.titleMedium,
        ),
        Padding(
          padding: const EdgeInsets.only(top: MPPadding.padding6),
          child: Text(
            MPStrings.watchListText,
            style: textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

class _WatchListWidget extends StatelessWidget {
  final List<MpMedia> items;
  const _WatchListWidget({
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(
            horizontal: MPPadding.padding12, vertical: MPPadding.padding6),
        itemBuilder: (_, index) => MPVerticalListView(mpMedia: items[index]),
        separatorBuilder: (_, index) => const SizedBox(
              height: MPSize.size12,
            ),
        itemCount: items.length);
  }
}
