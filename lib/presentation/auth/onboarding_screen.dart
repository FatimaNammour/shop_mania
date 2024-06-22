import 'package:flutter/material.dart';
import 'package:shop_mania/core/theme.dart';
import 'package:shop_mania/presentation/auth/page_view_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    PageController pageController =
        PageController(initialPage: 0, keepPage: false, viewportFraction: 1);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                    height: size.height * (2 / 3),
                    child: PageView(
                      controller: pageController,
                      children: const [
                        PageViewWidget(
                            imagePath: "assets/jeans.jpg",
                            subTitle:
                                "Various Collection of the latest products",
                            title: "Various Collection of the latest products"),
                        PageViewWidget(
                            imagePath: "assets/jeans.jpg",
                            subTitle:
                                "Various Collection of the latest products",
                            title: "Various Collection of the latest products"),
                        PageViewWidget(
                            imagePath: "assets/jeans.jpg",
                            subTitle:
                                "Various Collection of the latest products",
                            title: "Various Collection of the latest products"),
                      ],
                    )),
                SmoothPageIndicator(
                  controller: pageController, // PageController
                  count: 3,
                  textDirection: TextDirection.ltr,
                  effect: const WormEffect(
                      dotColor: ConstColors.displaySmall,
                      dotHeight: 8,
                      dotWidth: 8),
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                        '/RegisterScreen',
                      );
                    },
                    child: const Text("Create Account")),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                        '/LoginScreen',
                      );
                    },
                    child: const Text(
                      "Already have an account",
                    )),
                const SizedBox(
                  height: 10,
                ),
              ]),
        ),
      ),
    );
  }
}
