import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruit_hub/core/styles/app_colors.dart';
import 'package:fruit_hub/core/styles/app_text_styles.dart';

class DontHaveAccount extends StatelessWidget {
  const DontHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            children: [
              TextSpan(
                text: 'لا تمتلك حساب؟ ',
                style: TextStyles.semiBold16.copyWith(
                  color: Color(0xff949d9e),
                  fontFamily: 'cairo',
                ),
              ),
              TextSpan(
                text: 'قم بإنشاء حساب',
                style: TextStyles.semiBold16.copyWith(
                  color: AppColors.primaryColor,
                  fontFamily: 'cairo',
                ),
                recognizer: TapGestureRecognizer()..onTap = () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
