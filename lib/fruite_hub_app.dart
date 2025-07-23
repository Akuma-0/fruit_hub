import 'package:flutter/material.dart';
import 'package:fruit_hub/core/routing/router.dart';
import 'package:fruit_hub/features/onpoardin/ui/screens/on_boarding_screen.dart';
import 'package:fruit_hub/features/splash/ui/screens/splash_screen.dart';

class FruiteHubApp extends StatelessWidget {
  const FruiteHubApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: onGenerateRoute,
      initialRoute: SplashScreen.routeName,
      debugShowCheckedModeBanner: false,
    );
  }
}