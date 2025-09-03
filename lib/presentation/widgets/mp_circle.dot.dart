
import 'package:flutter/widgets.dart';
import 'package:movies_planet/resources/mp_colors.dart';
import 'package:movies_planet/resources/mp_values.dart';

class MPCircleDot extends StatelessWidget {
  const MPCircleDot({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:MPPadding.padding8),
      child: Container(width: MPSize.size6,height: MPSize.size6,decoration: const BoxDecoration(shape: BoxShape.circle,color: MPColors.circleDotColor),),
    );
  }
}