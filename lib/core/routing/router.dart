import 'package:flutter/material.dart';
import 'package:fruit_hub/features/auth/ui/screens/login_screen.dart';
import 'package:fruit_hub/features/auth/ui/screens/register_screen.dart';
import 'package:fruit_hub/features/on_boarding/ui/screens/on_boarding_screen.dart';
import 'package:fruit_hub/features/splash/ui/screens/splash_screen.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashScreen.routeName:
      return MaterialPageRoute(builder: (context) => SplashScreen());
    case OnBoardingScreen.routeName:
      return MaterialPageRoute(builder: (context) => OnBoardingScreen());
    case LoginScreen.routeName:
      return MaterialPageRoute(builder: (context) => LoginScreen());
    case RegisterScreen.routeName:
      return MaterialPageRoute(builder: (context) => RegisterScreen());

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
