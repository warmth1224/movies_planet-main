import 'package:flutter/material.dart';
import 'package:movies_planet/presentation/widgets/mp_image_with_place_holder.dart';
import 'package:movies_planet/resources/mp_values.dart';
import '../../../data/model/mp_cast.dart';

class MPCastCard extends StatelessWidget {
  const MPCastCard({super.key, required this.cast});
  final MpCast cast;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SizedBox(
      width: MPSize.size100,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(MPSize.size8),
            child: MPImageWithPlaceHolder(
                imageUrl: cast.profileUrl,
                height: MPSize.size130,
                width: double.infinity),
          ),
          Text(
            cast.name,
            style: textTheme.bodyLarge,
            maxLines: 2,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
