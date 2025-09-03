import 'package:flutter/material.dart';
import 'package:movies_planet/data/model/mp_media.dart';
import 'package:movies_planet/presentation/widgets/cards/mp_card_image.dart';
import 'package:movies_planet/resources/mp_constants.dart';
import 'package:movies_planet/resources/mp_colors.dart';
import 'package:movies_planet/resources/mp_values.dart';
import 'package:movies_planet/utils/mp_functions.dart';

class MPSliderCard extends StatelessWidget {
  const MPSliderCard({super.key, required this.media, required this.itemIndex});
  final MpMedia media;
  final int itemIndex;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () => navigateToDetailView(context, media),
      child: SafeArea(
        child: Stack(
          children: [
            MPCardImage(imageUrl: media.backdropUrl),
            Padding(
              padding: const EdgeInsets.only(
                  right: MPPadding.padding16,
                  left: MPPadding.padding16,
                  bottom: MPPadding.padding20),
              child: SizedBox(
                height: size.height * .55,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      media.title,
                      maxLines: 2,
                      style: textTheme.titleMedium,
                    ),
                    Text(
                      media.releaseDate,
                      style: textTheme.bodyLarge,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: MPPadding.padding4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: List.generate(
                            MPConstants.carouselSliderItemsCount,
                            (index) => Container(
                                  margin: const EdgeInsets.only(
                                      right: MPMargin.margin10),
                                  width: index == itemIndex
                                      ? MPSize.size30
                                      : MPSize.size6,
                                  height: MPSize.size6,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                        MPSize.size6,
                                      ),
                                      color: index == itemIndex
                                          ? MPColors.primary
                                          : MPColors.inactiveColor),
                                )),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
