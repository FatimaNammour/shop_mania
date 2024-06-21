import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../business_logic/auth/register/register_bloc.dart';
import '../../../core/theme.dart';
import '../../../core/widgets/app_text_field.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({required this.registerBloc, super.key});
  final RegisterBloc registerBloc;

  @override
  Widget build(BuildContext context) {
    return ReactiveForm(
      formGroup: registerBloc.form,
      child: Column(children: [
        //username input
        AppTextField(
          fieldfocusNode: registerBloc.usernameFocusNode,
          onFocus: () {
            registerBloc.add(RegisterUsernameChanged(
                registerBloc.form.control("username").value.toString(),
                registerBloc.usernameFocusNode.hasFocus));
          },
          onChanged: (usernameFormControl) {
            registerBloc.add(RegisterUsernameChanged(usernameFormControl.value,
                registerBloc.usernameFocusNode.hasFocus));
          },
          textInputAction: TextInputAction.next,
          textInputType: TextInputType.name,
          formName: "username",
          hintText: "Create your username",
          labelText: "Username",
          prefixIcon: const Icon(
            Icons.person_2_outlined,
            color: ConstColors.displayMedium,
          ),
        ),
        const SizedBox(height: 15),

        //email input
        InkWell(
          onTap: () {
            FocusScope.of(context).requestFocus(registerBloc.emailFocusNode);
          },
          child: AppTextField(
            onFocus: () {
              registerBloc.add(RegisterUsernameChanged(
                  registerBloc.form.control("email").value,
                  registerBloc.emailFocusNode.hasFocus));
            },
            fieldfocusNode: FocusNode(),
            onChanged: (emailFormControl) {
              registerBloc.add(RegisterEmailChanged(emailFormControl.value));
            },
            textInputAction: TextInputAction.next,
            textInputType: TextInputType.name,
            formName: "email",
            hintText: "Enter your Email",
            labelText: "Email",
            prefixIcon: const Icon(
              Icons.email_outlined,
              color: ConstColors.displayMedium,
            ),
          ),
        ),
        const SizedBox(height: 15),
        //number input
        AppTextField(
          onFocus: () {
            registerBloc.add(RegisterUsernameChanged(
                registerBloc.form.control("phoneNumber").value,
                registerBloc.numberFocusNode.hasFocus));
          },
          fieldfocusNode: FocusNode(),
          onChanged: (numberFormControl) {
            registerBloc.add(RegisterNumberChanged(numberFormControl.value));
          },
          textInputAction: TextInputAction.next,
          textInputType: TextInputType.name,
          formName: "phoneNumber",
          hintText: "Enter your number",
          labelText: "Number",
          prefixIcon: const Icon(
            Icons.phone_android_outlined,
            color: ConstColors.displayMedium,
          ),
        ),
        const SizedBox(height: 15),
        //password input
        AppTextField(
          onFocus: () {
            registerBloc.add(RegisterUsernameChanged(
                registerBloc.form.control("password").value,
                registerBloc.passwordFocusNode.hasFocus));
          },
          fieldfocusNode: FocusNode(),
          onChanged: (passwordFormControl) {
            registerBloc
                .add(RegisterPasswordChanged(passwordFormControl.value));
          },
          textInputAction: TextInputAction.next,
          textInputType: TextInputType.name,
          formName: "password",
          hintText: "Create your password",
          labelText: "Password",
          suffixIcon: const Icon(
            Icons.remove_red_eye_outlined,
            color: ConstColors.displayMedium,
          ),
          prefixIcon: const Icon(
            Icons.lock_outline,
            color: ConstColors.displayMedium,
          ),
        ),
        const SizedBox(height: 15),
        //repeat password input
        AppTextField(
          onFocus: () {
            registerBloc.add(RegisterUsernameChanged(
                registerBloc.form.control("passwordRepeat").value,
                registerBloc.repeatPasswordFocusNode.hasFocus));
          },
          fieldfocusNode: FocusNode(),
          onChanged: (passwordRFormControl) {
            registerBloc
                .add(RegisterPasswordRepeatChanged(passwordRFormControl.value));
          },
          textInputAction: TextInputAction.next,
          textInputType: TextInputType.name,
          formName: "passwordRepeat",
          hintText: "Repeat your password",
          labelText: "Repeat Password",
          suffixIcon: const Icon(
            Icons.remove_red_eye_outlined,
            color: ConstColors.displayMedium,
          ),
          prefixIcon: const Icon(
            Icons.lock_outline,
            color: ConstColors.displayMedium,
          ),
        ),
      ]),
    );
  }
}
