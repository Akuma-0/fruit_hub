import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hub/core/services/firebase_auth_service.dart';
import 'package:fruit_hub/core/services/shared_preferences_singleton.dart';
import 'package:fruit_hub/features/auth/ui/screens/login_screen.dart';
import 'package:fruit_hub/features/home/ui/screens/home_screen.dart';
import 'package:fruit_hub/features/on_boarding/ui/screens/on_boarding_screen.dart';

class ScreenBody extends StatefulWidget {
  const ScreenBody({super.key});

  @override
  State<ScreenBody> createState() => _ScreenBodyState();
}

class _ScreenBodyState extends State<ScreenBody> {
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
          mainAxisAlignment: MainAxisAlignment.end,
          children: [SvgPicture.asset('assets/images/plant.svg')],
        ),
        SvgPicture.asset('assets/images/logo.svg'),
        SvgPicture.asset('assets/images/splash_bottom.svg', fit: BoxFit.fill),
      ],
    );
  }

  void executeNavigation() {
    Future.delayed(const Duration(seconds: 2), () {
      if (FirebaseAuthService().isLoggedIn()) {
        Navigator.pushReplacementNamed(context, HomeScreen.routeName);
      } else if (SharedPreferencesSingleton.getBool('isOnBoardingCompleted')) {
        Navigator.pushReplacementNamed(context, LoginScreen.routeName);
      } else {
        Navigator.pushReplacementNamed(context, OnBoardingScreen.routeName);
      }
    });
  }
}
