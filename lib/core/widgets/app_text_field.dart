import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:shop_mania/core/theme.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    Key? key,
    this.form,
    this.formName,
    this.label,
    // required this.onSubmitted,
    required this.onChanged,
    required this.textInputType,
    required this.textInputAction,
    // this.isVerificationCode = false,
    this.labelText,
    this.hintText,
    this.suffixIcon,
    this.validationMessages,
    // this.focusNode,
  }) : super(key: key);

  final FormControl? form;
  final String? formName;
  final String? label;
  final String? labelText;
  final String? hintText;

  // final Function(FormControl<dynamic>)? onSubmitted;
  final Function(FormControl<dynamic>)? onChanged;
  final Map<String, String Function(Object)>? validationMessages;
  // final bool isVerificationCode;
  final Widget? suffixIcon;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  // final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        labelText != null
            ? Text(labelText!,
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(fontSize: 18))
            : SizedBox(),
        ReactiveTextField(
          textInputAction: textInputAction,
          keyboardType: textInputType,
          // onSubmitted: onSubmitted,
          onChanged: onChanged,
          textDirection: TextDirection.ltr,
          formControl: form,
          formControlName: formName,
          validationMessages: validationMessages,
          decoration: InputDecoration(
            hintTextDirection: TextDirection.ltr,
            suffixIcon: suffixIcon,
            contentPadding: const EdgeInsets.symmetric(
              vertical: 5.0,
              horizontal: 10.0,
            ),
            hintStyle: const TextStyle(
                color: ConstColors.displayMedium,
                fontSize: 16.0,
                fontWeight: FontWeight.normal),
            hintText: hintText,

            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(
                color: ConstColors.displayLarge,
              ),
            ),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: ConstColors.displayMedium),
                borderRadius: BorderRadius.all(Radius.circular(20))),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: ConstColors.displayMedium),
                borderRadius: BorderRadius.all(Radius.circular(20))),
            disabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              borderSide: BorderSide(color: Colors.transparent, width: 1.5),
            ),
            // errorText: "errorText",
            errorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                borderSide: BorderSide(color: ConstColors.red)),
            focusedErrorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide(color: ConstColors.displayLarge),
            ),
          ),
        ),
      ],
    );
  }
}
