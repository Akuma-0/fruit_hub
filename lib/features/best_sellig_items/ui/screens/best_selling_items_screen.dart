import 'package:flutter/material.dart';
import 'package:fruit_hub/core/widgets/Custom_app_bar.dart';
import 'package:fruit_hub/core/widgets/notification_button.dart';
import 'package:fruit_hub/features/best_sellig_items/ui/screens/widgets/best_selling_items_screen_body.dart';

class BestSellingItemsScreen extends StatelessWidget {
  const BestSellingItemsScreen({super.key});
  static const String routeName = 'best_selling_items';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        title: 'الأكثر مبيعًا',
        context: context,
        actions: [
          NotificationButton(),
          SizedBox(width: 16),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: BestSellingItemsScreenBody(),
      ),
    );
  }
}
