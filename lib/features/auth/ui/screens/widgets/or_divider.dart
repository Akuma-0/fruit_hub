import 'package:flutter/material.dart';
import 'package:fruit_hub/core/styles/app_text_styles.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(color: Color(0xffDDDFDF))),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Text(
            'أو',
            style: TextStyles.semiBold16,
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(child: Divider(color: Color(0xffDDDFDF))),
      ],
    );
  }
}
