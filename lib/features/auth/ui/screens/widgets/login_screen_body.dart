import 'package:flutter/material.dart';
import 'package:fruit_hub/core/styles/app_colors.dart';
import 'package:fruit_hub/core/styles/app_text_styles.dart';
import 'package:fruit_hub/core/widgets/app_text_button.dart';
import 'package:fruit_hub/core/widgets/app_text_form_field.dart';
import 'package:fruit_hub/features/auth/ui/screens/widgets/dont_have_account.dart';
import 'package:fruit_hub/features/auth/ui/screens/widgets/or_divider.dart';
import 'package:fruit_hub/features/auth/ui/screens/widgets/social_login_button.dart';

class LoginScreenBody extends StatelessWidget {
  LoginScreenBody({super.key});
  bool isObsecure = true;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            SizedBox(height: 24),
            AppTextFormField(
              hintText: 'البريد الإلكتروني',
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16),
            AppTextFormField(
              hintText: 'كلمة المرور',
              keyboardType: TextInputType.visiblePassword,
              isObscure: isObsecure,
              suffixIcon: IconButton(
                color: Color(0xffC9CECF),
                onPressed: () {
                  isObsecure = !isObsecure;
                },
                icon: Icon(Icons.visibility),
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'نسيت كلمة المرور؟',
                  style: TextStyles.semiBold13.copyWith(
                    color: AppColors.lightPrimaryColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: 33),
            AppTextButton(
              text: 'تسجيل الدخول',
              onPressed: () {},
              color: AppColors.primaryColor,
            ),
            SizedBox(height: 33),
            DontHaveAccount(),
            SizedBox(height: 33),
            OrDivider(),
            SizedBox(height: 16),
            SocialLoginButton(
              text: 'تسجيل بواسطة جوجل',
              iconPath: 'assets/images/google_icon.svg',
              onPressed: () {},
            ),
            SizedBox(height: 16),
            SocialLoginButton(
              text: 'تسجيل بواسطة أبل',
              iconPath: 'assets/images/apple_icon.svg',
              onPressed: () {},
            ),
            SizedBox(height: 16),
            SocialLoginButton(
              text: 'تسجيل بواسطة فيسبوك',
              iconPath: 'assets/images/facebook_icon.svg',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
