import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hub/core/services/shared_preferences_singleton.dart';
import 'package:fruit_hub/core/styles/app_text_styles.dart';
import 'package:fruit_hub/features/auth/ui/screens/login_screen.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    required this.image,
    required this.backgroundImage,
    required this.subtitle,
    required this.title,
    required this.isSkipVisible,
  });
  final String image, backgroundImage, subtitle;
  final Widget title;
  final bool isSkipVisible;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.5,
          child: Stack(
            children: [
              Positioned.fill(
                child: SvgPicture.asset(backgroundImage, fit: BoxFit.fill),
              ),
              Positioned(
                child: SvgPicture.asset(image),
                bottom: 0,
                left: 0,
                right: 0,
              ),
              Visibility(
                visible: isSkipVisible,
                child: Positioned(
                  child: GestureDetector(
                    onTap: () {
                      SharedPreferencesSingleton.setBool(
                        'isOnBoardingCompleted',
                        true,
                      );
                      Navigator.of(
                        context,
                      ).pushReplacementNamed(LoginScreen.routeName);
                    },
                    child: Text(
                      'تخط',
                      style: TextStyles.regular13.copyWith(
                        color: Color(0xff949d9e),
                      ),
                    ),
                  ),
                  top: 50,
                  right: 20,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 64),
        title,
        SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 37),
          child: Text(
            subtitle,
            textAlign: TextAlign.center,
            style: TextStyles.semiBold13.copyWith(color: Color(0xff4e5456)),
          ),
        ),
      ],
    );
  }
}
