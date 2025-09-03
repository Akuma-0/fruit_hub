import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hub/core/styles/app_text_styles.dart';

class HomeScreenAppBar extends StatelessWidget {
  const HomeScreenAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset('assets/images/avatar.png'),
      title: Text(
        'صباح الخير !..',
        style: TextStyles.regular16.copyWith(color: Color(0xff949D9E)),
      ),
      subtitle: Text('أحمد مصطفي', style: TextStyles.bold16),
      trailing: Container(
       padding: EdgeInsets.all(12),
        child: SvgPicture.asset('assets/images/notification_icon.svg',),
        decoration: ShapeDecoration(
          color: Color(0xffEEF8ED),
          shape: OvalBorder()
        ),
      ),
    );
  } 
}
