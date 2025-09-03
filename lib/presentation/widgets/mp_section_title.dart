import 'package:flutter/material.dart';

import '../../resources/mp_values.dart';


class MPSectionTitle extends StatelessWidget {
  const MPSectionTitle({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: MPPadding.padding16,
        left: MPPadding.padding16,
        top: MPPadding.padding8,
        bottom: MPPadding.padding4,
      ),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleSmall,
      ),
    );
  }
}
