import 'package:flutter/material.dart';
import 'package:movies_planet/resources/mp_values.dart';

class MPSectionListView extends StatelessWidget {
  const MPSectionListView(
      {super.key,
      required this.itemCount,
      required this.height,
      required this.itemBuilder});
  final int itemCount;
  final double height;
  final Widget Function(BuildContext, int index) itemBuilder;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
          itemBuilder: itemBuilder,
          separatorBuilder: (_, index) => const SizedBox(
                width: MPSize.size10,
              ),
          itemCount: itemCount),
    );
  }
}
