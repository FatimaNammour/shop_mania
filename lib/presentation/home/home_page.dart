import 'package:flutter/material.dart';
import 'package:shop_mania/core/theme.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    PageController pageController =
        PageController(initialPage: 0, keepPage: false, viewportFraction: 1);

    return SizedBox(
      height: 600,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            SizedBox(
                height: size.height * (1 / 5),
                child: PageView(
                  controller: pageController,
                  children: [
                    Container(
                      height: 120,
                      decoration: const BoxDecoration(
                          color: ConstColors.displaySmall,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                    Container(
                      height: 120,
                      decoration: const BoxDecoration(
                          color: ConstColors.displaySmall,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                    Container(
                      height: 120,
                      decoration: const BoxDecoration(
                          color: ConstColors.displaySmall,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                  ],
                )),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: SmoothPageIndicator(
                controller: pageController, // PageController
                count: 3,
                textDirection: TextDirection.ltr,
                effect: const WormEffect(
                    dotColor: ConstColors.displaySmall,
                    dotHeight: 8,
                    dotWidth: 8),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "New Arrifals 💥",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                TextButton(onPressed: () {}, child: Text("See all"))
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 400,
              child: GridView.builder(
                  itemCount: 10,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10),
                  itemBuilder: (context, int index) {
                    return Container(
                      height: 120,
                      width: 30,
                      decoration: const BoxDecoration(
                          color: ConstColors.displaySmall,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
