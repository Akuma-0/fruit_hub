import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppTextButton extends StatelessWidget {
  AppTextButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.color,
    this.textColor,
  });
  final String text;
  final VoidCallback onPressed;
  final Color? color;
  Color? textColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
        minimumSize: WidgetStatePropertyAll(Size(double.infinity, 54)),
        backgroundColor: WidgetStatePropertyAll(color),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: 16,
          fontWeight: FontWeight.w700,
          fontFamily: 'Cairo',
        )
      ),
    );
  }
}
