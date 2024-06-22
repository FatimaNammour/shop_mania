import 'package:flutter/material.dart';

class PageViewWidget extends StatelessWidget {
  const PageViewWidget(
      {super.key,
      required this.imagePath,
      required this.title,
      required this.subTitle});
  final String imagePath;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Container(
          height: size.height * 0.49,
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: const BorderRadius.all(Radius.circular(50)),
              image: DecorationImage(
                  image: AssetImage(imagePath), fit: BoxFit.fill)),
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        Text(
          subTitle,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ]),
    );
  }
}
