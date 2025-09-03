import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_planet/data/model/mp_search.dart';
import 'package:movies_planet/presentation/widgets/mp_image_with_place_holder.dart';

import '../../../resources/mp_routes.dart';
import '../../../resources/mp_values.dart';

class MpGridViewCard extends StatelessWidget {
  const MpGridViewCard({super.key, required this.item});
  final MpSearch item;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        InkWell(
          onTap: () => item.isMovie
              ? context.pushNamed(
                  MPRoutes.movieDetailsRoute,
                  pathParameters: {
                    'movieId': item.tmdbID.toString(),
                  },
                )
              : context.pushNamed(
                  MPRoutes.tvShowDetailsRoute,
                  pathParameters: {
                    'tvShowId': item.tmdbID.toString(),
                  },
                ),
          child: AspectRatio(
            aspectRatio: 4 / 6,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(MPSize.size10),
              child: MPImageWithPlaceHolder(
                  imageUrl: item.posterUrl,
                  height: MPSize.size160,
                  width: double.infinity),
            ),
          ),
        ),
        Expanded(
          child: Text(
            item.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }
}
