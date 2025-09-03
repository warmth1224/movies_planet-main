
import 'package:flutter/material.dart';

import '../../resources/mp_strings.dart';

class MpErrorText extends StatelessWidget {
  const MpErrorText({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          MPStrings.oops,
          style: textTheme.titleMedium,
        ),
        Text(
          MPStrings.errorMessage,
          style: textTheme.bodyLarge,
        ),
        Text(
         MPStrings.tryAgainLater,
          style: textTheme.bodyLarge,
        ),
      ],
    );
  }
}