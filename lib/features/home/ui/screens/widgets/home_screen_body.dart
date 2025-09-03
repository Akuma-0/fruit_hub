import 'package:flutter/material.dart';
import 'package:fruit_hub/features/home/ui/screens/widgets/home_screen_app_bar.dart';
import 'package:fruit_hub/core/widgets/search_text_field.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: HomeScreenAppBar()),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(children: [SizedBox(height: 16,),SearchTextField()]),
            ),
          ),
        ],
      ),
    );
  }
}
