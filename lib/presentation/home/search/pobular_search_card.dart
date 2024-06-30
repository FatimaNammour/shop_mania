import 'package:flutter/material.dart';
import 'package:shop_mania/core/theme.dart';

import '../../../core/constant/enums.dart';

class PobularSearchCard extends StatelessWidget {
  const PobularSearchCard(
      {required this.title,
      required this.subTitle,
      required this.resultStatus,
      super.key,
      required this.imagePath});
  final String title;
  final String subTitle;
  final String imagePath;
  final ResultStatus resultStatus;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 70,
        height: 70,
        decoration: BoxDecoration(
          color: ConstColors.displayMedium,
          image:
              DecorationImage(image: AssetImage(imagePath), fit: BoxFit.fill),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
      ),
      subtitle: Text(subTitle),
      title: Text(title),
      trailing: SearchCardState(
        resultStatus: resultStatus,
      ),
    );
  }
}

class SearchCardState extends StatelessWidget {
  const SearchCardState({required this.resultStatus, super.key});
  final ResultStatus resultStatus;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 30,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          color: getBackColor(resultStatus)),
      child: Center(
        child: Text(
          getText(resultStatus),
          style: TextStyle(color: getTextColor(resultStatus)),
        ),
      ),
    );
  }

  String getText(ResultStatus result) {
    switch (result) {
      case ResultStatus.hot:
        return "Hot";

      case ResultStatus.pobular:
        return "Pobular";

      case ResultStatus.neww:
        return "New";

      default:
        return "New";
    }
  }

  Color getBackColor(ResultStatus result) {
    switch (result) {
      case ResultStatus.hot:
        return ConstColors.cardBackRed;

      case ResultStatus.pobular:
        return ConstColors.cardBackorange;

      case ResultStatus.neww:
        return ConstColors.cardBackGreen;

      default:
        return ConstColors.cardBackGreen;
    }
  }

  Color getTextColor(ResultStatus result) {
    switch (result) {
      case ResultStatus.hot:
        return Colors.red;

      case ResultStatus.pobular:
        return Colors.orange;

      case ResultStatus.neww:
        return Colors.green;

      default:
        return Colors.green;
    }
  }
}
