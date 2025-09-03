import 'package:flutter/widgets.dart';
import 'package:movies_planet/data/model/mp_cast.dart';
import 'package:movies_planet/data/model/mp_media_details.dart';
import 'package:movies_planet/data/model/mp_review.dart';
import 'package:movies_planet/presentation/widgets/mp_section_list_view.dart';
import 'package:movies_planet/presentation/widgets/mp_section_title.dart';
import 'package:movies_planet/resources/mp_strings.dart';
import 'package:movies_planet/resources/mp_values.dart';
import '../../utils/mp_functions.dart';
import 'cards/mp_cast_card.dart';
import 'cards/mp_detail_card.dart';
import 'cards/mp_movies_detail_card.dart';
import 'cards/mp_review_card.dart';


class MPMoviesDetailWidget extends StatelessWidget {
  const MPMoviesDetailWidget({super.key, required this.mediaDetails});
  final MpMediaDetails mediaDetails;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MPDetailCard(
            mediaDetails: mediaDetails,
            detailWidget: MPMoviesDetailCard(
              mediaDetails: mediaDetails,
            ),
          ),
          overViewSection(mediaDetails.overview),
          _castSection(mediaDetails.cast),
          _reviewSection(mediaDetails.reviews),
          similarMediaSection(mediaDetails.similar),
           const SizedBox(height: MPSize.size12),
        ],
      ),
    );
  }

  Widget _castSection(List<MpCast>? cast) {
    if (cast != null && cast.isNotEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const MPSectionTitle(title: MPStrings.cast),
          MPSectionListView(
            itemCount: cast.length,
            height: MPSize.size175,
            itemBuilder: (context, index) => MPCastCard(cast: cast[index]),
          ),
        ],
      );
    } else {
      return const SizedBox();
    }
  }

  Widget _reviewSection(List<MpReview>? reviews) {
    if (reviews != null && reviews.isNotEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const MPSectionTitle(title: MPStrings.reviews),
          MPSectionListView(
              itemCount: reviews.length,
              height: MPSize.size175,
              itemBuilder: (context, index) =>
                  MPReviewCard(review: reviews[index]))
        ],
      );
    } else {
      return const SizedBox();
    }
  }
}
