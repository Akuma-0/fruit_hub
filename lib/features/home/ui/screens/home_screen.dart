import 'package:flutter/material.dart';
import 'package:fruit_hub/features/home/ui/screens/widgets/home_screen_body.dart';
import 'package:fruit_hub/features/home/ui/screens/widgets/home_screen_bottom_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String routeName = 'home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: HomeScreenBody(),
      ),
      bottomNavigationBar: HomeScreenBottomNavBar(),
    );
  }
}
