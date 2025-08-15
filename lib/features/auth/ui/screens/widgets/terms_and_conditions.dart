import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruit_hub/core/styles/app_colors.dart';
import 'package:fruit_hub/core/styles/app_text_styles.dart';
import 'package:fruit_hub/core/widgets/app_check_box.dart';

class TermsAndConditions extends StatefulWidget {
  TermsAndConditions({super.key, required this.onChanged});

  final ValueChanged<bool> onChanged;

  @override
  State<TermsAndConditions> createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
  bool isAgreed = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppCheckBox(
          isChecked: isAgreed,
          onChecked: (value) {
            setState(() {
              isAgreed = value;
              widget.onChanged(value);
            });
          },
        ),

        SizedBox(width: 16),
        Expanded(
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'من خلال إنشاء حساب جديد، فإنك توافق على ',
                      style: TextStyles.semiBold13.copyWith(
                        color: Color(0xff949d9e),
                        fontFamily: 'cairo',
                      ),
                    ),
                    TextSpan(
                      text: 'الشروط والأحكام الخاصة بنا',
                      style: TextStyles.semiBold13.copyWith(
                        color: AppColors.lightPrimaryColor,
                        fontFamily: 'cairo',
                      ),
                      recognizer: TapGestureRecognizer()..onTap = () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
