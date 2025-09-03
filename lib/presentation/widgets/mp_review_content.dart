import 'package:flutter/material.dart';
import 'package:movies_planet/data/model/mp_review.dart';
import 'package:movies_planet/presentation/widgets/mp_avatar.dart';
import 'package:movies_planet/resources/mp_values.dart';

class MPReviewContent extends StatelessWidget {
  const MPReviewContent({super.key, required this.review});
  final MpReview review;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(MPPadding.padding16),
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: MPPadding.padding6),
                  child: MPAvatar(imageUrl: review.avatarUrl),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      review.authorName,
                      style: textTheme.bodyMedium,
                    ),
                    Text(
                      review.authorUserName,
                      style: textTheme.bodyLarge,
                    ),
                  ],
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: MPPadding.padding10),
              child: Text(
                review.content,
                style: textTheme.bodyLarge,
              ),
            )
          ],
        ),
      ),
    );
  }
}
