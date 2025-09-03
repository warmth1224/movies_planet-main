import 'package:flutter/material.dart';
import 'package:movies_planet/data/model/mp_media.dart';
import 'package:movies_planet/presentation/widgets/mp_image_with_place_holder.dart';
import 'package:movies_planet/resources/mp_colors.dart';
import 'package:movies_planet/resources/mp_values.dart';
import 'package:movies_planet/utils/mp_functions.dart';

class MPVerticalListView extends StatelessWidget {
  const MPVerticalListView({super.key, required this.mpMedia});
  final MpMedia mpMedia;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () => navigateToDetailView(context, mpMedia),
      child: Container(
        height: MPSize.size175,
        decoration: BoxDecoration(
            color: MPColors.secondaryBackground,
            borderRadius: BorderRadius.circular(MPSize.size8)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadiusDirectional.circular(MPSize.size8),
                child: MPImageWithPlaceHolder(
                    imageUrl: mpMedia.posterUrl,
                    height: double.infinity,
                    width: MPSize.size120),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: MPPadding.padding4),
                    child: Text(
                      mpMedia.title,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: textTheme.titleSmall,
                    ),
                  ),
                  Row(
                    children: [
                      if (mpMedia.releaseDate.isNotEmpty) ...[
                        Padding(
                          padding:
                              const EdgeInsets.only(right: MPPadding.padding12),
                          child: Text(
                            mpMedia.releaseDate.split(', ')[0],
                            textAlign: TextAlign.center,
                            style: textTheme.bodyLarge,
                          ),
                        ),
                      ],
                      const Icon(
                        Icons.star_rate_rounded,
                        color: MPColors.ratingIconColor,
                        size: MPSize.size18,
                      ),
                      Text(
                        mpMedia.averageVote.toString(),
                        style: textTheme.bodyLarge,
                      )
                    ],
                  ),
                   Padding(
                    padding: const EdgeInsets.only(top: MPPadding.padding14),
                    child: Text(
                      mpMedia.overview,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: textTheme.bodyLarge,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
