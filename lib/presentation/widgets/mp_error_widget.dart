import 'package:flutter/material.dart';
import 'package:movies_planet/presentation/widgets/mp_error_text.dart';
import 'package:movies_planet/resources/mp_strings.dart';
import 'package:movies_planet/resources/mp_values.dart';

class MPErrorWidget extends StatelessWidget {
  const MPErrorWidget({
    super.key,
    required this.onTryAgainTap,
  });
  final Function() onTryAgainTap;
  @override
  Widget build(BuildContext context) {
    final textThem = Theme.of(context).textTheme;
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: MPPadding.padding20),
            child: Image.asset('assets/icon.png'),
          ),
          const MpErrorText(),
          const SizedBox(height:MPSize.size15),
          ElevatedButton(
              onPressed: onTryAgainTap,
              child: Text(
                MPStrings.tryAgain,
                style: textThem.bodyMedium,
              ))
        ],
      ),
    );
  }
}
