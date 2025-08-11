import 'package:flutter/material.dart';
import 'package:fruit_hub/core/styles/app_text_styles.dart';

class AppTextFormField extends StatelessWidget {
  AppTextFormField({
    super.key,
    required this.hintText,
    this.controller,
    this.validator,
    required this.keyboardType,
    this.isObscure = false,
    this.suffixIcon,
  });
  final String hintText;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final TextInputType keyboardType;
  bool isObscure;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      obscureText: isObscure,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        hint: Text(
          hintText,
          style: TextStyles.bold13.copyWith(color: Color(0xff949D9E)),
        ),
        fillColor: Color(0xffF9FAFA),
        filled: true,
        enabledBorder: buildBorder(),
        border: buildBorder(),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: BorderSide(color: Color(0xffE6E9EA)),
    );
  }
}
