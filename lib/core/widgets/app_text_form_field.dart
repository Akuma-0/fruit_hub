import 'package:flutter/material.dart';
import 'package:fruit_hub/core/styles/app_text_styles.dart';

class AppTextFormField extends StatelessWidget {
  AppTextFormField({
    super.key,
    required this.hintText,
    this.controller,
    required this.keyboardType,
    this.isObscure = false,
    this.suffixIcon,
    this.onSaved,
  });
  final String hintText;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  bool isObscure;
  final Widget? suffixIcon;
  void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'هذا الحقل مطلوب';
        }
        return null;
      },
      onSaved: onSaved,
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
