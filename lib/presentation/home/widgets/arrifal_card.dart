import 'package:flutter/material.dart';
import 'package:shop_mania/core/theme.dart';

class ArrifalCard extends StatelessWidget {
  const ArrifalCard(
      {super.key,
      required this.productName,
      required this.storeName,
      required this.price});
  final String productName;
  final String storeName;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          fit: StackFit.passthrough,
          children: [
            Container(
              height: 160,
              decoration: const BoxDecoration(
                  color: ConstColors.fieldFilled,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
            ),
            Align(
              alignment: Alignment.topRight,
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
