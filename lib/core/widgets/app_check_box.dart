import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hub/core/styles/app_colors.dart';

class AppCheckBox extends StatelessWidget {
  AppCheckBox({super.key, required this.isChecked, required this.onChecked});
  final bool isChecked;
  final ValueChanged<bool> onChecked;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChecked(!isChecked);
      },
      child: AnimatedContainer(
        width: 24,
        height: 24,
        duration: Duration(microseconds: 150),
        decoration: ShapeDecoration(
          color: isChecked ? AppColors.primaryColor : Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(8),
            side: BorderSide(
              color: isChecked ? Colors.transparent : Color(0xffDDDFDF),
              width: 1.5,
            ),
          ),
        ),
        child: isChecked
            ? Padding(
              padding: const EdgeInsets.all(1.5),
              child: SvgPicture.asset('assets/images/check_icon.svg'),
            )
            : SizedBox(),
      ),
    );
  }
}
