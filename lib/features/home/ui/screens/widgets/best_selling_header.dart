import 'package:flutter/material.dart';
import 'package:fruit_hub/core/styles/app_text_styles.dart';
import 'package:fruit_hub/features/best_sellig_items/ui/screens/best_selling_items_screen.dart';

class BestSellingHeader extends StatelessWidget {
  const BestSellingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('الأكثر مبيعًا', style: TextStyles.bold16),
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(BestSellingItemsScreen.routeName);
          },
          child: Text(
            'المزيد',
            style: TextStyles.regular13.copyWith(color: Color(0xff949D9E)),
          ),
        ),
      ],
    );
  }
}
