import 'package:flutter/material.dart';
import 'package:fruit_hub/features/splash/ui/screens/widgets/splash_view_body.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  static const String routeName = '/splash';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashScreenBody(),
      backgroundColor: Colors.white,
    );
  }
}
