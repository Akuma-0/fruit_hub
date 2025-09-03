import 'package:flutter/material.dart';
import 'package:fruit_hub/core/styles/app_text_styles.dart';

class BestSellingHeader extends StatelessWidget {
  const BestSellingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('الأكثر مبيعًا', style: TextStyles.bold16),
        Text(
          'المزيد',
          style: TextStyles.regular13.copyWith(color: Color(0xff949D9E)),
        ),
      ],
    );
  }
}
