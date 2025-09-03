import 'package:flutter/material.dart';
import 'package:movies_planet/resources/mp_values.dart';

class MpVerticalListViewSeparator extends StatefulWidget {
  const MpVerticalListViewSeparator(
      {super.key,
      required this.itemCount,
      required this.itemBuilder,
      required this.addEvent});
  final int itemCount;
  final Widget Function(BuildContext context, int index) itemBuilder;
  final Function addEvent;

  @override
  State<MpVerticalListViewSeparator> createState() =>
      _MpVerticalListViewSeparateState();
}

class _MpVerticalListViewSeparateState
    extends State<MpVerticalListViewSeparator> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: _scrollController,
        itemBuilder: widget.itemBuilder,
        separatorBuilder: (_, index) => const SizedBox(
              height: MPSize.size12,
            ),
        itemCount: widget.itemCount,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(MPPadding.padding10),);
  }
  void _onScroll() {
    if (_scrollController.position.atEdge) {
      if (_scrollController.position.pixels != 0) {
        widget.addEvent();
      }
    }
  }

}
