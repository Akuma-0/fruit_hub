import 'package:flutter/material.dart';
import 'package:fruit_hub/features/home/ui/screens/widgets/best_selling_header.dart';
import 'package:fruit_hub/features/home/ui/screens/widgets/best_selling_items_grid.dart';
import 'package:fruit_hub/features/home/ui/screens/widgets/featured_list.dart';
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
            child: Column(
              children: [
                SizedBox(height: 16),
                SearchTextField(),
                SizedBox(height: 12),
                FeaturedList(),
                SizedBox(height: 12),
                BestSellingHeader(),
                SizedBox(height: 8),
              ],
            ),
          ),
          BestSellingItemsGrid(),
        ],
      ),
    );
  }
}
