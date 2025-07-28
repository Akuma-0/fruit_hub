import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fruit_hub/core/routing/router.dart';
import 'package:fruit_hub/features/splash/ui/screens/splash_screen.dart';
import 'package:fruit_hub/generated/l10n.dart';

class FruitHubApp extends StatelessWidget {
  const FruitHubApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: const Locale('ar'),
      onGenerateRoute: onGenerateRoute,
      initialRoute: SplashScreen.routeName,
      debugShowCheckedModeBanner: false,
    );
  }
}
