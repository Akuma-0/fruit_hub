import 'package:flutter/material.dart';
import 'package:fruit_hub/features/home/domain/entities/bottom_nav_bar_entity.dart';
import 'package:fruit_hub/features/home/ui/screens/widgets/nav_bar_active_item.dart';
import 'package:fruit_hub/features/home/ui/screens/widgets/nav_bar_inactive_item.dart';

class NavBarItem extends StatelessWidget {
  const NavBarItem({
    super.key,
    required this.isSelected,
    required this.bottomNavBarEntity,
  });
  final bool isSelected;
  final BottomNavBarEntity bottomNavBarEntity;
  @override
  Widget build(BuildContext context) {
    return isSelected
        ? ActiveItem(
          image: bottomNavBarEntity.activeItem,
          name: bottomNavBarEntity.name,
        )
        : InactiveItem(image: bottomNavBarEntity.inactiveItem);
  }
}
