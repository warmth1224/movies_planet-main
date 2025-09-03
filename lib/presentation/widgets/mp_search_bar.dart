import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../business/search_bloc/search_bloc.dart';
import '../../resources/mp_colors.dart';
import '../../resources/mp_strings.dart';
import '../../resources/mp_values.dart';


class MpSearchBar extends StatefulWidget {
  const MpSearchBar({
    super.key,
  });

  @override
  State<MpSearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<MpSearchBar> {
  final _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Form(
      child: TextFormField(
        controller: _textController,
        cursorColor: MPColors.primaryText,
        cursorWidth: MPSize.size1,
        style: textTheme.bodyLarge,
        onChanged: (query) {
          context.read<SearchBloc>().add(GetSearchEvent(query));
        },
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: MPColors.primaryText,
            ),
            borderRadius: BorderRadius.circular(MPSize.size22),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: MPColors.primaryText,
            ),
            borderRadius: BorderRadius.circular(MPSize.size10),
          ),
          prefixIcon: const Icon(
            Icons.search_rounded,
            color: MPColors.primaryText,
          ),
          suffixIcon: GestureDetector(
            onTap: () {
              _textController.text = '';
              context.read<SearchBloc>().add(const GetSearchEvent(''));
            },
            child: const Icon(
              Icons.clear_rounded,
              color: MPColors.primaryText,
            ),
          ),
          hintText: MPStrings.searchHint,
          hintStyle: textTheme.bodyLarge,
        ),
      ),
    );
  }
}
