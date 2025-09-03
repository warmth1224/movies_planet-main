import 'package:flutter/material.dart';
import 'package:movies_planet/resources/mp_strings.dart';
import 'package:movies_planet/resources/mp_values.dart';
import 'package:readmore/readmore.dart';

class MPOverViewSection extends StatelessWidget {
  const MPOverViewSection({super.key, required this.overView});
  final String overView;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:MPPadding.padding16,vertical: MPPadding.padding2),
      child: ReadMoreText(
        overView,
        trimLines: 6,
        trimMode: TrimMode.Line,
        trimCollapsedText: MPStrings.showMore,
        trimExpandedText: MPStrings.showLess,
        style: Theme.of(context).textTheme.bodyLarge,
        moreStyle: Theme.of(context)
            .textTheme
            .bodyLarge!
            .copyWith(fontWeight: FontWeight.w600),
        lessStyle: Theme.of(context)
            .textTheme
            .bodyLarge!
            .copyWith(fontWeight: FontWeight.w600),
      ),
    );
  }
}
