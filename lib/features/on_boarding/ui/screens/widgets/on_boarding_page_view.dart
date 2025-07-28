import 'package:flutter/material.dart';
import 'package:fruit_hub/features/on_boarding/ui/screens/widgets/page_view_item.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key, required this.pageController});
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [
        PageViewItem(
          isSkipVisible:
              (pageController.hasClients ? pageController.page!.round() : 0) ==
              0,
          image: 'assets/images/page_view1_image.svg',
          backgroundImage: 'assets/images/page_view1_background.svg',
          subtitle:
              'اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.',
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text('مرحبًا بك في '), Text('HUB'), Text('Fruit')],
          ),
        ),
        PageViewItem(
          isSkipVisible:
              (pageController.hasClients ? pageController.page!.round() : 0) !=
              0,
          image: 'assets/images/page_view2_image.svg',
          backgroundImage: 'assets/images/page_view2_background.svg',
          subtitle:
              'نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية',
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text('ابحث وتسوق')],
          ),
        ),
      ],
    );
  }
}
