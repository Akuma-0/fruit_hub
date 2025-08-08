import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:fruit_hub/core/services/shared_preferences_singleton.dart';
import 'package:fruit_hub/core/styles/app_colors.dart';
import 'package:fruit_hub/core/widgets/app_text_button.dart';
import 'package:fruit_hub/features/auth/ui/screens/login_screen.dart';
import 'package:fruit_hub/features/on_boarding/ui/screens/widgets/on_boarding_page_view.dart';

class ScreenBody extends StatefulWidget {
  const ScreenBody({super.key});

  @override
  State<ScreenBody> createState() => _ScreenBodyState();
}

class _ScreenBodyState extends State<ScreenBody> {
  late PageController pageController;
  var currentPage = 0;

  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      setState(() {
        currentPage = pageController.page!.round();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: OnBoardingPageView(pageController: pageController)),
        DotsIndicator(
          dotsCount: 2,
          position: currentPage.toDouble(),
          decorator: DotsDecorator(
            activeColor: AppColors.primaryColor,
            color:
                (currentPage == 1)
                    ? AppColors.primaryColor
                    : AppColors.lightGreen.withAlpha(150),
            activeSize: Size.square(11),
            size: Size.square(9),
          ),
        ),
        SizedBox(height: 29),
        Visibility(
          maintainAnimation: true,
          maintainSize: true,
          maintainState: true,
          visible: currentPage == 1,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: AppTextButton(
              text: 'ابدأ الآن',
              onPressed: () {
                SharedPreferencesSingleton.setBool('isOnBoardingCompleted', true);
                Navigator.of(
                  context,
                ).pushReplacementNamed(LoginScreen.routeName);
              },
              color: AppColors.primaryColor,
              textColor: Colors.white,
            ),
          ),
        ),
        SizedBox(height: 43),
      ],
    );
  }
}
