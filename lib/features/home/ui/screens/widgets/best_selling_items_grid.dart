import 'package:flutter/material.dart';
import 'package:fruit_hub/core/widgets/fruit_item_card.dart';

class BestSellingItemsGrid extends StatelessWidget {
  const BestSellingItemsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 163 / 214,
        crossAxisSpacing: 16,
        mainAxisSpacing: 8,
      ),
      itemBuilder: (context, index) {
        return FruitItemCard();
      },
    );
  }
}
