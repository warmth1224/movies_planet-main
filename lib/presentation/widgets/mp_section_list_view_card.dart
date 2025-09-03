import 'package:flutter/material.dart';
import 'package:movies_planet/data/model/mp_media.dart';
import 'package:movies_planet/presentation/widgets/mp_image_with_place_holder.dart';
import 'package:movies_planet/resources/mp_values.dart';
import 'package:movies_planet/utils/mp_functions.dart';

import '../../resources/mp_colors.dart';

class MPSectionListViewCard extends StatelessWidget {
  const MPSectionListViewCard({super.key, required this.mpMedia});
  final MpMedia mpMedia;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SizedBox(
      width: MPSize.size120,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              navigateToDetailView(context, mpMedia);
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(MPSize.size10),
              child: MPImageWithPlaceHolder(
                  imageUrl: mpMedia.posterUrl,
                  height: MPSize.size175,
                  width: double.infinity),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: MPPadding.padding4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  mpMedia.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.bodyMedium,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.star_rate_rounded,
                      color: MPColors.ratingIconColor,
                      size: MPSize.size18,
                    ),
                    Text(
                      '${mpMedia.averageVote}/10',
                      style: textTheme.bodySmall,
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
