import 'package:flutter/material.dart';
import 'package:fruit_hub/features/home/ui/screens/widgets/home_screen_app_bar.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [SliverToBoxAdapter(child: HomeScreenAppBar())],
      ),
    );
  }
}
