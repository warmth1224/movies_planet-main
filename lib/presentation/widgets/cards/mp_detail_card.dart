import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_planet/business/watch_list_bloc/watch_list_bloc.dart';
import 'package:movies_planet/data/model/mp_media.dart';
import 'package:movies_planet/data/model/mp_media_details.dart';
import 'package:movies_planet/presentation/widgets/cards/mp_card_image.dart';
import 'package:movies_planet/resources/mp_colors.dart';
import 'package:movies_planet/resources/mp_values.dart';
import 'package:url_launcher/url_launcher.dart';

class MPDetailCard extends StatelessWidget {
  const MPDetailCard({
    super.key,
    required this.mediaDetails,
    required this.detailWidget,
  });

  final MpMediaDetails mediaDetails;
  final Widget detailWidget;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    context.read<WatchListBloc>().add(CheckItemAddedEvent(mediaDetails.tmdbID));
    return SafeArea(
        child: Stack(
      children: [
        MPCardImage(imageUrl: mediaDetails.backdropUrl),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: MPSize.size20),
          child: SizedBox(
            height: size.height * .6,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        mediaDetails.title,
                        maxLines: 2,
                        style: textTheme.titleMedium,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: MPPadding.padding4,
                            bottom: MPPadding.padding6),
                        child: detailWidget,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.star_rate_rounded,
                            color: MPColors.ratingIconColor,
                            size: MPSize.size20,
                          ),
                          Text(
                            '${mediaDetails.averageVote} ',
                            style: textTheme.bodyMedium,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                if (mediaDetails.trailerUrl.isNotEmpty) ...[
                  InkWell(
                    onTap: () async {
                      final url = Uri.parse(mediaDetails.trailerUrl);
                      if (await canLaunchUrl(url)) {
                        await launchUrl(url);
                      }
                    },
                    child: Container(
                      height: MPSize.size40,
                      width: MPSize.size40,
                      decoration: const BoxDecoration(
                        color: MPColors.primary,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.play_arrow_sharp,
                        color: MPColors.secondaryText,
                      ),
                    ),
                  )
                ]
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
              top: MPPadding.padding12,
              left: MPPadding.padding16,
              right: MPPadding.padding16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () => Navigator.of(context).pop(),
                child: Container(
                  padding: const EdgeInsets.all(MPPadding.padding10),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: MPColors.iconContainerColor,
                  ),
                  child: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: MPColors.secondaryText,
                    size: MPSize.size20,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  if (mediaDetails.isAdded) {
                    context.read<WatchListBloc>().add(
                          RemoveWatchListItemsEvent(index: mediaDetails.id!),
                        );
                  } else {
                    context.read<WatchListBloc>().add(
                          AddWatchListItemsEvent(
                            media: MpMedia.fromMpMediaDetails(mediaDetails),
                          ),
                        );
                  }
                },
                child: Container(
                  padding: const EdgeInsets.all(MPPadding.padding10),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: MPColors.iconContainerColor,
                  ),
                  child: BlocConsumer<WatchListBloc, WatchListState>(
                      listener: (context, state) {
                    if (state.status == WatchListRequestStatus.itemAdded) {
                      mediaDetails.id = null;
                      mediaDetails.isAdded = false;
                    } else if (state.status ==
                        WatchListRequestStatus.itemRemoved) {
                      mediaDetails.id = null;
                      mediaDetails.isAdded = false;
                    } else if (state.status ==
                            WatchListRequestStatus.isItemAdded &&
                        state.id != -1) {
                      mediaDetails.id = state.id;
                      mediaDetails.isAdded = true;
                    }
                  }, builder: (context, state) {
                    return Icon(
                      Icons.bookmark_rounded,
                      color: mediaDetails.isAdded
                          ? MPColors.primary
                          : MPColors.secondaryText,
                      size: MPSize.size22,
                    );
                  }),
                ),
              )
            ],
          ),
        )
      ],
    ));
  }
}
