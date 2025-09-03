import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:movies_planet/resources/mp_constants.dart';

class MPSlider extends StatelessWidget {
  const MPSlider({super.key, required this.itemBuilder});
  final Widget Function(BuildContext context, int index, int) itemBuilder;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return CarouselSlider.builder(
      itemCount: MPConstants.carouselSliderItemsCount,
      itemBuilder: itemBuilder,
      options: CarouselOptions(
          viewportFraction: 1, height: size.height * .54, autoPlay: true),
    );
  }
}
