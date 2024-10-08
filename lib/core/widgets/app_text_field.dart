import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:shop_mania/core/theme.dart';

class AppTextField extends StatefulWidget {
  const AppTextField(
      {Key? key,
      this.form,
      this.formName,
      this.label,
      required this.onChanged,
      this.onSubmitted,
      required this.onFocus,
      required this.textInputType,
      required this.textInputAction,
      // this.isVerificationCode = false,
      this.labelText,
      this.hintText,
      this.suffixIcon,
      this.onTapSuffixIcon,
      this.prefixIcon,
      this.validationMessages,
      required this.fieldfocusNode,
      this.autoFocus})
      : super(key: key);

  final FormControl? form;
  final String? formName;
  final String? label;
  final String? labelText;
  final String? hintText;
  final Function(FormControl<dynamic>)? onChanged;
  final Function(FormControl<dynamic>)? onSubmitted;

  final Function()? onFocus;
  final Map<String, String Function(Object)>? validationMessages;
  final Widget? suffixIcon;
  final Function()? onTapSuffixIcon;

  final Widget? prefixIcon;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final FocusNode? fieldfocusNode;
  final bool? autoFocus;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  @override
  void initState() {
    widget.fieldfocusNode!.addListener(_focusNodeListener);
    super.initState();
  }

  void _focusNodeListener() {
    widget.onFocus!();
  }

  @override
  void dispose() {
    widget.fieldfocusNode!.removeListener(_focusNodeListener);
    widget.fieldfocusNode!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.labelText != null
            ? Text(widget.labelText!,
                style: Theme.of(context).textTheme.labelLarge)
            : const SizedBox(),
        ReactiveTextField(
          focusNode: widget.fieldfocusNode,
          autofocus: widget.autoFocus ?? false,
          textInputAction: widget.textInputAction,
          keyboardType: widget.textInputType,
          onChanged: widget.onChanged,
          onSubmitted: widget.onSubmitted,
          textDirection: TextDirection.ltr,
          formControl: widget.form,
          formControlName: widget.formName,
          validationMessages: widget.validationMessages,
          decoration: InputDecoration(
            filled: widget.fieldfocusNode!.hasFocus ? false : true,
            fillColor: ConstColors.fieldFilled,
            hintTextDirection: TextDirection.ltr,
            suffixIcon: widget.suffixIcon,
            prefixIcon: widget.prefixIcon,
            contentPadding: const EdgeInsets.symmetric(
              vertical: 5.0,
              horizontal: 10.0,
            ),
            hintStyle: Theme.of(context).textTheme.bodySmall,
            hintText: widget.hintText,
            border: const OutlineInputBorder(
                borderSide: BorderSide(color: ConstColors.fieldFilled),
                borderRadius: BorderRadius.all(Radius.circular(20))),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: ConstColors.primary),
                borderRadius: BorderRadius.all(Radius.circular(20))),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: ConstColors.fieldFilled),
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
                borderSide: BorderSide(color: ConstColors.cardBackRed)),
            focusedErrorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide(color: ConstColors.cardBackRed),
            ),
          ),
        ),
      ],
    );
  }
}
