import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruit_hub/core/styles/app_colors.dart';
import 'package:fruit_hub/core/styles/app_text_styles.dart';
import 'package:fruit_hub/features/auth/ui/screens/register_screen.dart';

class DontHaveAccount extends StatelessWidget {
  const DontHaveAccount({
    super.key,
    required this.text1,
    required this.text2,
    required this.onTap,
  });
  final String text1, text2;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            children: [
              TextSpan(
                text: text1,
                style: TextStyles.semiBold16.copyWith(
                  color: Color(0xff949d9e),
                  fontFamily: 'cairo',
                ),
              ),
              TextSpan(
                text: text2,
                style: TextStyles.semiBold16.copyWith(
                  color: AppColors.primaryColor,
                  fontFamily: 'cairo',
                ),
                recognizer:
                    TapGestureRecognizer()
                      ..onTap = () {
                        onTap();
                      },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
