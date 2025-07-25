import 'package:flutter/material.dart';
import 'package:fruit_hub/features/onpoardin/ui/screens/on_boarding_screen.dart';
import 'package:fruit_hub/features/splash/ui/screens/splash_screen.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashScreen.routeName:
      return MaterialPageRoute(builder: (context) => SplashScreen());
    case OnBoardingScreen.routeName:
      return MaterialPageRoute(builder: (context) => OnBoardingScreen());
    default:
      return MaterialPageRoute(
        builder:
            (context) => Scaffold(
              backgroundColor: Colors.white,
              body: Center(child: Text('Page not found')),
            ),
      );
  }
}
