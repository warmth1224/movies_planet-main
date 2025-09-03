import 'package:flutter/material.dart';

import '../../resources/mp_strings.dart';
import '../../resources/mp_values.dart';


class MpSearchText extends StatelessWidget {
  const MpSearchText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            MPStrings.search,
            style: textTheme.titleMedium,
          ),
          Padding(
            padding: const EdgeInsets.only(top: MPPadding.padding8),
            child: Text(
              MPStrings.searchText,
              style: textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
