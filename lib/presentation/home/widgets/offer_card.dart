import 'package:flutter/material.dart';
import 'package:shop_mania/core/theme.dart';

class OfferCard extends StatelessWidget {
  const OfferCard({super.key, required this.title, required this.subTitle});
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0),
      child: Stack(
        fit: StackFit.passthrough,
        children: [
          Container(
            height: 110,
            decoration: const BoxDecoration(
                color: ConstColors.fieldFilled,
                borderRadius: BorderRadius.all(Radius.circular(20))),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 200.0,
                child: Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontSize: 18),
                  softWrap: true,
                  textAlign: TextAlign.center,
                ),
              ),
              Text(
                subTitle,
                style: Theme.of(context).textTheme.titleMedium,
              )
            ],
          )
        ],
      ),
    );
  }
}
