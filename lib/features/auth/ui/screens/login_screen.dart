import 'package:flutter/material.dart';
import 'package:fruit_hub/core/styles/app_text_styles.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  static const String routeName = '/login';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('تسجيل دخول', style: TextStyles.bold19),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Center(child: Text('Login Screen')),
    );
  }
}
