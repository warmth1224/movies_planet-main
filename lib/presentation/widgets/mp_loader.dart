import 'package:flutter/material.dart';
import 'package:movies_planet/resources/mp_colors.dart';

class MPLoader extends StatelessWidget {
  const MPLoader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator.adaptive(
        backgroundColor: MPColors.primary,
      ),
    );
  }
}
