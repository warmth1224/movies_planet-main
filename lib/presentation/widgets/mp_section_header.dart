import 'package:flutter/material.dart';
import 'package:movies_planet/resources/mp_values.dart';

import '../../resources/mp_colors.dart';
import '../../resources/mp_strings.dart';

class MPSectionHeader extends StatelessWidget {
  const MPSectionHeader({super.key, required this.onSeeAllTap, required this.title});
  final Function() onSeeAllTap;
  final String title;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return  Padding(
      padding: const EdgeInsets.symmetric(
          vertical: MPPadding.padding4, horizontal: MPPadding.padding18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: textTheme.titleSmall,
          ),
          GestureDetector(onTap: onSeeAllTap,
          child: Row(
            children: [
                Text(
                  MPStrings.seeAll,
                  style: textTheme.bodyLarge,
                ),
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: MPSize.size12,
                  color: MPColors.primaryText,
                ),
            ],
          ),)
        ],
      ),
    );
  }
}
