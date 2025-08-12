import 'package:flutter/material.dart';
import 'package:fruit_hub/core/styles/app_colors.dart';
import 'package:fruit_hub/core/widgets/app_text_button.dart';
import 'package:fruit_hub/core/widgets/app_text_form_field.dart';
import 'package:fruit_hub/features/auth/ui/screens/widgets/dont_have_account.dart';
import 'package:fruit_hub/features/auth/ui/screens/widgets/terms_and_conditions.dart';

class RegisterScreenBody extends StatefulWidget {
  RegisterScreenBody({super.key});

  @override
  State<RegisterScreenBody> createState() => _RegisterScreenBodyState();
}

class _RegisterScreenBodyState extends State<RegisterScreenBody> {
  bool isObsecure = true;
  bool isAgreed = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Form(
          child: Column(
            children: [
              SizedBox(height: 24),
              AppTextFormField(
                hintText: 'الاسم كامل',
                keyboardType: TextInputType.name,
              ),
              SizedBox(height: 16),
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
                    setState(() {
                      isObsecure = !isObsecure;
                    });
                  },
                  icon:
                      isObsecure
                          ? Icon(Icons.visibility)
                          : Icon(Icons.visibility_off),
                ),
              ),
              SizedBox(height: 16),
              TermsAndConditions(),
              SizedBox(height: 33),
              AppTextButton(
                text: 'إنشاء حساب جديد',
                onPressed: () {},
                color: AppColors.primaryColor,
              ),
              SizedBox(height: 33),
              DontHaveAccount(
                text1: 'تمتلك حساب بالفعل؟ ',
                text2: 'تسجيل دخول',
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              SizedBox(height: 33),
            ],
          ),
        ),
      ),
    );
  }
}
