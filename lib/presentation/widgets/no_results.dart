import 'package:flutter/material.dart';

import '../../resources/mp_strings.dart';


class NoResults extends StatelessWidget {
  const NoResults({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Expanded(
      child: Center(
        child: Text(
          MPStrings.noResults,
          style: textTheme.bodyLarge,
        ),
      ),
    );
  }
}
