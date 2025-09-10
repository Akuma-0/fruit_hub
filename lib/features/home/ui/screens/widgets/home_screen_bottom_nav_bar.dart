import 'package:flutter/material.dart';
import 'package:fruit_hub/features/home/domain/entities/bottom_nav_bar_entity.dart';
import 'package:fruit_hub/features/home/ui/screens/widgets/nav_bar_item.dart';

class HomeScreenBottomNavBar extends StatefulWidget {
  const HomeScreenBottomNavBar({super.key});

  @override
  State<HomeScreenBottomNavBar> createState() => _HomeScreenBottomNavBarState();
}

class _HomeScreenBottomNavBarState extends State<HomeScreenBottomNavBar> {
  int currentIndex = 2;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375,
      height: 70,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 25,
            offset: Offset(0, -2),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children:
            getBottomNavBarItems().asMap().entries.map((e) {
              return Expanded(
                flex: currentIndex == e.key ? 3 : 2,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      currentIndex = e.key;
                    });
                  },
                  child: NavBarItem(
                    bottomNavBarEntity: e.value,
                    isSelected: currentIndex == e.key,
                  ),
                ),
              );
            }).toList(),
      ),
    );
  }
}
