import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_planet/resources/mp_values.dart';


class MPAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MPAppBar({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Size get preferredSize => const Size.fromHeight(MPSize.size60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      leading: context.canPop()
          ? IconButton(
              onPressed: () {
                context.pop();
              },
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                size: MPSize.size22,
              ),
            )
          : null,
    );
  }
}
