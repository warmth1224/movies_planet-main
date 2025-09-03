import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:movies_planet/resources/mp_colors.dart';
import 'package:movies_planet/resources/mp_values.dart';
import 'package:shimmer/shimmer.dart';

class MPAvatar extends StatelessWidget {
  const MPAvatar({
    super.key,
    required this.imageUrl,
  });
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) => CircleAvatar(
        radius: MPSize.size20,
        backgroundColor: MPColors.transparent,
        backgroundImage: imageProvider,
      ),
      fit: BoxFit.cover,
      placeholder: (_, __) => Shimmer.fromColors(
          baseColor: MPColors.shimmerColor.withOpacity(.85),
          highlightColor: MPColors.shimmerColor.withOpacity(.8),
          child: Container(
            color: MPColors.secondaryText,
          )),
      errorWidget: (_, __, ___) => const Icon(
        Icons.error,
        color: MPColors.error,
      ),
    );
  }
}
