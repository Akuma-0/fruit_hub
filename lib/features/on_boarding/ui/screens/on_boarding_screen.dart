import 'package:flutter/material.dart';
import 'package:fruit_hub/features/on_boarding/ui/screens/widgets/on_boarding_screen_body.dart';
 
class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});
  static const String routeName = 'onboarding';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBody(),
    );
  }
}