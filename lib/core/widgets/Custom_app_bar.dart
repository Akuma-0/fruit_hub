import 'package:flutter/material.dart';
import 'package:fruit_hub/core/styles/app_text_styles.dart';

AppBar buildAppBar({
  required String title,
  bool isBackButtonVisible = true,
  required BuildContext context,
}) {
  return AppBar(
    title: Text(title, style: TextStyles.bold19, textAlign: TextAlign.center),
    centerTitle: true,
    elevation: 0,
    automaticallyImplyLeading: false,
    leading:
        isBackButtonVisible
            ? GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back_ios_new),
            )
            : null,
  );
}
