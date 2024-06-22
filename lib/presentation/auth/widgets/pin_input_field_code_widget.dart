import 'package:flutter/material.dart';
import 'package:pincode_input_fields/pincode_input_fields.dart';

import '../../../core/theme.dart';

class PinInputFieldCodeWidget extends StatefulWidget {
  const PinInputFieldCodeWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return PinInputFieldCodeWidgetSatte();
  }
}

class PinInputFieldCodeWidgetSatte extends State<PinInputFieldCodeWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
      child: PincodeInputFields(
        textStyle: Theme.of(context).textTheme.titleLarge,
        length: 5,
        cursorColor: ConstColors.primary,
        autoFocus: true,
        unfocusFieldColor: ConstColors.pinfieldFilled,
        unfocusBorder: Border.all(color: ConstColors.pinfieldFilled),
        animationDuration: const Duration(milliseconds: 300),
        onChanged: (value) {
          debugPrint(value);
        },
        enabled: true,
      ),
    );
  }
}
