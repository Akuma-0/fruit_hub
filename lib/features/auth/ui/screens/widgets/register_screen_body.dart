import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/helpers/build_error_bar.dart';
import 'package:fruit_hub/core/styles/app_colors.dart';
import 'package:fruit_hub/core/widgets/app_text_button.dart';
import 'package:fruit_hub/core/widgets/app_text_form_field.dart';
import 'package:fruit_hub/features/auth/ui/cubits/register_cubit/register_cubit.dart';
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
  final formKey = GlobalKey<FormState>();
  late String name, email, password;
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Form(
          autovalidateMode: autoValidateMode,
          key: formKey,
          child: Column(
            children: [
              SizedBox(height: 24),
              AppTextFormField(
                hintText: 'الاسم كامل',
                keyboardType: TextInputType.name,
                onSaved: (value) {
                  name = value!;
                },
              ),
              SizedBox(height: 16),
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
                keyboardType: TextInputType.visiblePassword,
                isObscure: isObsecure,
                onSaved: (value) {
                  password = value!;
                },
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
              TermsAndConditions(
                onChanged: (bool value) {
                  setState(() {
                    isAgreed = value;
                  });
                },
              ),
              SizedBox(height: 33),
              AppTextButton(
                text: 'إنشاء حساب جديد',
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    if (isAgreed) {
                      context
                          .read<RegisterCubit>()
                          .createUserWithEmailAndPassword(
                            name,
                            email,
                            password,
                          );
                    } else {
                      buildErrorBar(
                        context,
                        'يجب الموافقة على الشروط والأحكام',
                      );
                    }
                  } else {
                    setState(() {
                      autoValidateMode = AutovalidateMode.always;
                    });
                  }
                },
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
