import 'package:flutter/material.dart';
import 'package:fruit_hub/core/styles/app_text_styles.dart';

AppBar buildAppBar({
  required String title,
  bool isBackButtonVisible = true,
  required BuildContext context,
  List<Widget> actions = const [],
}) {
  return AppBar(
    title: Text(title, style: TextStyles.bold19, textAlign: TextAlign.center),
    centerTitle: true,
    elevation: 0,
    automaticallyImplyLeading: false,
    scrolledUnderElevation: 0,
    leading:
        isBackButtonVisible
            ? GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back_ios_new),
            )
            : null,
    actions: actions,
  );
}
