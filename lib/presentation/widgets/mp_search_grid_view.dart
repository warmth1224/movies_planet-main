import 'package:flutter/material.dart';
import 'package:movies_planet/data/model/mp_search.dart';
import 'package:movies_planet/presentation/widgets/cards/mp_grid_view_card.dart';

class MpGridView extends StatelessWidget {
  const MpGridView({super.key, required this.results});
  final List<MpSearch> results;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GridView.builder(
           itemCount: results.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 12,
              childAspectRatio: 0.60,
            ),
            itemBuilder: (context, index) {
              return MpGridViewCard(item: results[index]);
            }));
  }
}
