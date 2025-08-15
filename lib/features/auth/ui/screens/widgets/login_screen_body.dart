import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/styles/app_colors.dart';
import 'package:fruit_hub/core/styles/app_text_styles.dart';
import 'package:fruit_hub/core/widgets/app_text_button.dart';
import 'package:fruit_hub/core/widgets/app_text_form_field.dart';
import 'package:fruit_hub/features/auth/ui/cubits/login_cubit/login_cubit.dart';
import 'package:fruit_hub/features/auth/ui/screens/register_screen.dart';
import 'package:fruit_hub/features/auth/ui/screens/widgets/dont_have_account.dart';
import 'package:fruit_hub/features/auth/ui/screens/widgets/or_divider.dart';
import 'package:fruit_hub/features/auth/ui/screens/widgets/social_login_button.dart';

class LoginScreenBody extends StatefulWidget {
  LoginScreenBody({super.key});

  @override
  State<LoginScreenBody> createState() => _LoginScreenBodyState();
}

class _LoginScreenBodyState extends State<LoginScreenBody> {
  bool isObsecure = true;
  late String email, password;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              SizedBox(height: 24),
              AppTextFormField(
                hintText: 'البريد الإلكتروني',
                keyboardType: TextInputType.emailAddress,
                onSaved: (value) {
                  email = value!;
                },
              ),
              SizedBox(height: 16),
              AppTextFormField(
                hintText: 'كلمة المرور',
                onSaved: (value) {
                  password = value!;
                },
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
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    context.read<LoginCubit>().loginWithEmailAndPassword(
                      email: email,
                      password: password,
                    );
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
                color: AppColors.primaryColor,
              ),
              SizedBox(height: 33),
              DontHaveAccount(
                text1: 'لا تمتلك حساب؟ ',
                text2: 'قم بإنشاء حساب',
                onTap: () {
                  Navigator.pushNamed(context, RegisterScreen.routeName);
                },
              ),
              SizedBox(height: 33),
              OrDivider(),
              SizedBox(height: 16),
              //google login
              SocialLoginButton(
                text: 'تسجيل بواسطة جوجل',
                iconPath: 'assets/images/google_icon.svg',
                onPressed: () {
                  context.read<LoginCubit>().loginWithGoogle();
                },
              ),
              SizedBox(height: 16),
              //apple login
              SocialLoginButton(
                text: 'تسجيل بواسطة أبل',
                iconPath: 'assets/images/apple_icon.svg',
                onPressed: () {},
              ),
              SizedBox(height: 16),
              //facebook login
              SocialLoginButton(
                text: 'تسجيل بواسطة فيسبوك',
                iconPath: 'assets/images/facebook_icon.svg',
                onPressed: () {
                  context.read<LoginCubit>().loginWithFacebook();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
