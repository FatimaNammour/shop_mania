import 'package:flutter/material.dart';
import 'package:shop_mania/core/theme.dart';

class ArrifalCard extends StatelessWidget {
  const ArrifalCard(
      {super.key,
      required this.productName,
      required this.storeName,
      required this.price,
      required this.imagePath});
  final String productName;
  final String storeName;
  final String price;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          fit: StackFit.passthrough,
          children: [
            Container(
              height: 160,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(imagePath), fit: BoxFit.fill),
                  color: ConstColors.fieldFilled,
                  borderRadius: const BorderRadius.all(Radius.circular(20))),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Opacity(
                opacity: 0.7,
                child: Container(
                  width: 40.0,
                  height: 40.0,
                  margin: const EdgeInsets.only(top: 10, right: 10),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: ConstColors.displaySmall),
                  child: const Center(
                    child: Icon(
                      Icons.favorite_border_outlined,
                      color: ConstColors.white,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        Column(
          children: [
            Text(
              productName,
              style: Theme.of(context).textTheme.labelLarge,
            ),
            Text(
              storeName,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Text(
              "\$ $price",
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ],
        )
      ],
    );
  }
}
