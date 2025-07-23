import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hub/features/onpoardin/ui/screens/on_boarding_screen.dart';

class SplashScreenBody extends StatefulWidget {
  const SplashScreenBody({super.key});

  @override
  State<SplashScreenBody> createState() => _SplashScreenBodyState();
}

class _SplashScreenBodyState extends State<SplashScreenBody> {
  @override
  void initState() {
    executeNavigation();
    super.initState();
    // Add any initialization logic here if needed
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [SvgPicture.asset('assets/images/plant.svg')],
        ),
        SvgPicture.asset('assets/images/logo.svg'),
        SvgPicture.asset('assets/images/splash_bottom.svg', fit: BoxFit.fill),
      ],
    );
  }
  
  void executeNavigation() {
    Future.delayed( const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, OnBoardingScreen.routeName);
    });
  }
}
