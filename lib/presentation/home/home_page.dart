import 'package:flutter/material.dart';
import 'package:shop_mania/core/theme.dart';
import 'package:shop_mania/presentation/home/widgets/arrifal_card.dart';
import 'package:shop_mania/presentation/home/widgets/offer_card.dart';
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

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          SizedBox(
              height: size.height * (1 / 5),
              child: PageView(
                controller: pageController,
                children: const [
                  OfferCard(
                      imagePath: "assets/caroline-attwood.jpg",
                      title: "24% of shipping today on bag purchases",
                      subTitle: "By shop mania store"),
                  OfferCard(
                      imagePath: "assets/rachit-tank-2cFZ.jpg",
                      title: "24% of shipping today on bag purchases",
                      subTitle: "By shop mania store"),
                  OfferCard(
                      imagePath: "assets/domino-studio.jpg",
                      title: "24% of shipping today on bag purchases",
                      subTitle: "By shop mania store"),
                ],
              )),
          const SizedBox(
            height: 10,
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
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "New Arrifals 💥",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              TextButton(onPressed: () {}, child: const Text("See all"))
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Expanded(
            child: GridView.builder(
                itemCount: 10,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 10,
                    childAspectRatio: 100 / 130),
                itemBuilder: (context, int index) {
                  return const ArrifalCard(
                    imagePath: "assets/c-d-x-PDX.jpg",
                    productName: "Product name",
                    storeName: "store name",
                    price: "2151",
                  );
                }),
          ),
        ],
      ),
    );
  }
}
