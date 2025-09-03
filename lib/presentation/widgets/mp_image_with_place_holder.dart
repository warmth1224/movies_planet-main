import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:movies_planet/resources/mp_colors.dart';
import 'package:shimmer/shimmer.dart';

class MPImageWithPlaceHolder extends StatelessWidget {
  const MPImageWithPlaceHolder(
      {super.key,
      required this.imageUrl,
      required this.height,
      required this.width});
  final String imageUrl;
  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      height: height,
      width: width,
      fit: BoxFit.cover,
      placeholder: (_, __) => Shimmer.fromColors(
          baseColor: MPColors.shimmerColor.withOpacity(.85),
          highlightColor: MPColors.shimmerColor.withOpacity(.8),
          child: Container(
            height: height,
            color: MPColors.secondaryText,
          )),
      errorWidget: (_, __, ___) => const Icon(
        Icons.error,
        color: MPColors.error,
      ),
    );
  }
}
