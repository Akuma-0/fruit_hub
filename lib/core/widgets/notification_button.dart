import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NotificationButton extends StatelessWidget {
  const NotificationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      child: SvgPicture.asset('assets/images/notification_icon.svg'),
      decoration: ShapeDecoration(
        color: Color(0xffEEF8ED),
        shape: OvalBorder(),
      ),
    );
  }
}
