import 'package:flutter/material.dart';
import 'package:movies_planet/data/model/mp_review.dart';
import 'package:movies_planet/presentation/widgets/mp_avatar.dart';
import 'package:movies_planet/presentation/widgets/mp_review_content.dart';
import 'package:movies_planet/resources/mp_colors.dart';
import 'package:movies_planet/resources/mp_values.dart';
import 'package:movies_planet/utils/mp_functions.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MPReviewCard extends StatelessWidget {
  const MPReviewCard({super.key, required this.review});
  final MpReview review;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () => mpBottomSheet(context, MPReviewContent(review: review)),
      child: Container(
        padding: const EdgeInsets.all(MPPadding.padding12),
        width: MPSize.size240,
        height: double.infinity,
        decoration: BoxDecoration(
            color: MPColors.secondaryBackground,
            borderRadius: BorderRadius.circular(MPSize.size12)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: MPPadding.padding6),
                  child: MPAvatar(imageUrl: review.avatarUrl),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        review.authorName,
                        style: textTheme.bodyMedium,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        review.authorUserName,
                        style: textTheme.bodyLarge,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Text(
              review.content,
              style: textTheme.bodyLarge,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _getRatingBar(review.rating),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _getRatingBar(double rating) {
    if (rating != -1) {
      return RatingBarIndicator(
        rating: rating,
        itemSize: MPSize.size16,
        itemBuilder: (_, __) {
          return const Icon(
            Icons.star_rate_rounded,
            color: MPColors.ratingIconColor,
          );
        },
      );
    } else {
     return const SizedBox();
    }
  }
}
