import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../business_logic/auth/login/login_bloc.dart';
import '../../../core/theme.dart';
import '../../../core/widgets/app_text_field.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return ReactiveForm(
        formGroup: context.read<LoginBloc>().form,
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Email",
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge!
                        .copyWith(fontSize: 18)),
                AppTextField(
                  fieldfocusNode: context.read<LoginBloc>().emailFocusNode,
                  onFocus: () {
                    log("onFocus");
                  },
                  onChanged: (emailFormControl) {
                    log("asetestrtre000");
                    context
                        .read<LoginBloc>()
                        .add(LoginEmailChanged(emailFormControl.value));
                  },
                  textInputAction: TextInputAction.next,
                  textInputType: TextInputType.name,
                  formName: "email",
                  hintText: "Create your Email",
                  prefixIcon: const Icon(
                    Icons.email_outlined,
                    color: ConstColors.displaySmall,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Password",
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge!
                        .copyWith(fontSize: 18)),
                AppTextField(
                  fieldfocusNode: context.read<LoginBloc>().passwordFocusNode,
                  onFocus: () {
                    log("onFocus");
                  },
                  onChanged: (emailFormControl) {
                    log("asetestrtre000");
                    context
                        .read<LoginBloc>()
                        .add(LoginEmailChanged(emailFormControl.value));

                    // log(context.read<LoginBloc>().);
                  },
                  // onSubmitted: (passwordFormControl) {
                  //   context
                  //       .read<LoginBloc>()
                  //       .add(LoginEmailChanged(passwordFormControl.value));
                  // },
                  textInputAction: TextInputAction.next,
                  textInputType: TextInputType.name,
                  formName: "password",
                  hintText: "Enter your password",
                  // label: "Enter your password",
                  suffixIcon: const Icon(
                    Icons.remove_red_eye_outlined,
                    color: ConstColors.displaySmall,
                  ),
                  prefixIcon: const Icon(
                    Icons.lock_outline,
                    color: ConstColors.displaySmall,
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
