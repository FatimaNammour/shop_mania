import 'package:flutter/material.dart';
import 'package:shop_mania/core/theme.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});
  // final String title;
  // final String subTitle;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        itemBuilder: (context, index) {
          return categoryItem(context, index);
        });
  }

  Widget categoryItem(BuildContext context, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Stack(
        children: [
          Container(
            height: 110,
            decoration: const BoxDecoration(
                color: ConstColors.fieldFilled,
                borderRadius: BorderRadius.all(Radius.circular(20))),
          ),
          Positioned(
            left: index.isEven ? -40 : null,
            right: index.isEven ? null : -40,
            top: 20,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 200.0,
                  child: Text(
                    "title",
                    style: Theme.of(context).textTheme.bodyLarge,
                    softWrap: true,
                    textAlign: TextAlign.center,
                  ),
                ),
                Text(
                  "subTitle",
                  style: Theme.of(context).textTheme.labelMedium,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
