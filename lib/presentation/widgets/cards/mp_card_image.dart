import 'package:flutter/material.dart';
import 'package:movies_planet/presentation/widgets/mp_image_with_place_holder.dart';
import 'package:movies_planet/resources/mp_colors.dart';

class MPCardImage extends StatelessWidget {
  const MPCardImage({super.key, required this.imageUrl});
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ShaderMask(
      blendMode: BlendMode.dstIn,
      shaderCallback: (bounds) {
        return const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            MPColors.black,
            MPColors.black,
            MPColors.transparent,
          ],
          stops: [0.3, 0.5, 1],
        ).createShader( Rect.fromLTRB(0, 0, bounds.width, bounds.height));
      },
      child: MPImageWithPlaceHolder(
          imageUrl: imageUrl, height: size.height * .6, width: double.infinity),
    );
  }
}
