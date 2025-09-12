import 'package:flutter/material.dart';
import 'package:fruit_hub/core/helpers/get_user_data.dart';
import 'package:fruit_hub/core/styles/app_text_styles.dart';
import 'package:fruit_hub/core/widgets/notification_button.dart';

class HomeScreenAppBar extends StatelessWidget {
  const HomeScreenAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Image.asset('assets/images/avatar.png'),
      title: Text(
        'مرحبًا...!',
        style: TextStyles.regular16.copyWith(color: Color(0xff949D9E)),
      ),
      subtitle: Text(getUserData().name, style: TextStyles.bold16),
      trailing: NotificationButton(),
    );
  }
}
