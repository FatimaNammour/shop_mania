import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'package:shop_mania/business_logic/auth/register/register_bloc.dart';
import 'package:shop_mania/core/constant/enums.dart';
import 'package:shop_mania/core/widgets/app_text_field.dart';
import 'package:shop_mania/core/widgets/loading.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return SignUpPageState();
  }
}

class SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: BlocConsumer<RegisterBloc, RegisterState>(
            listener: (context, state) {
              log("state from listener");
              log(state.status.toString());

              if (state.status == SubmissionStatus.failed) {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    const SnackBar(content: Text('Authentication Failure')),
                  );
              }
              if (state.status == SubmissionStatus.dataMissing) {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    const SnackBar(content: Text('Please check your data')),
                  );
              }
            },
            builder: (context, state) {
              if (state.status == SubmissionStatus.inProgress) {
                return const Loading();
              } else {
                return ListView(children: [
                  const SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Create Account",
                          style: Theme.of(context).textTheme.displayLarge),
                      const SizedBox(height: 15),
                      Text("Start learning with create your account",
                          style: Theme.of(context).textTheme.displayMedium),
                    ],
                  ),
                  const SizedBox(height: 40),
                  const RegisterForm(),
                  const SizedBox(height: 30),
                  Center(
                    child: Column(
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              context
                                  .read<RegisterBloc>()
                                  .add(const RegisterSubmitted());
                            },
                            child: const Text("Create Account")),
                        const SizedBox(height: 15),
                        Text("Or using other method",
                            style: Theme.of(context).textTheme.displaySmall),
                        OutlinedButton.icon(
                          label: const Text("SignUp with google"),
                          icon: Image.asset(
                            "assets/google.png",
                            scale: 20,
                          ),
                          style: Theme.of(context).outlinedButtonTheme.style,
                          onPressed: () {
                            Navigator.of(context).pushNamed(
                              '/RegisterScreen',
                            );
                          },
                        ),
                        OutlinedButton.icon(
                          label: const Text("SignUp with facebook"),
                          icon: Image.asset(
                            "assets/facebook.png",
                            scale: 20,
                          ),
                          style: Theme.of(context).outlinedButtonTheme.style,
                          onPressed: () {
                            Navigator.of(context).pushNamed(
                              '/RegisterScreen',
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ]);
              }
            },
          ),
        ),
      ),
    );
  }
}

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return ReactiveForm(
      formGroup: context.read<RegisterBloc>().form,
      child: Column(children: [
        AppTextField(
          onChanged: (usernameFormControl) {
            log("asetestrtre000");
            context
                .read<RegisterBloc>()
                .add(RegisterUsernameChanged(usernameFormControl.value));
          },
          textInputAction: TextInputAction.next,
          textInputType: TextInputType.name,
          formName: "username",
          hintText: "Create your username",
          labelText: "Username",
        ),
        const SizedBox(height: 15),
        AppTextField(
          onChanged: (emailFormControl) {
            log("asetestrtre000");
            context
                .read<RegisterBloc>()
                .add(RegisterEmailChanged(emailFormControl.value));
          },
          textInputAction: TextInputAction.next,
          textInputType: TextInputType.name,
          formName: "email",
          hintText: "Create your Email",
          labelText: "Email",
        ),
        const SizedBox(height: 15),
        AppTextField(
          onChanged: (numberFormControl) {
            log("asetestrtre000");
            context
                .read<RegisterBloc>()
                .add(RegisterNumberChanged(numberFormControl.value));
          },
          textInputAction: TextInputAction.next,
          textInputType: TextInputType.name,
          formName: "phoneNumber",
          hintText: "Create your number",
          labelText: "Number",
        ),
        const SizedBox(height: 15),
        AppTextField(
          onChanged: (passwordFormControl) {
            log("asetestrtre000");
            context
                .read<RegisterBloc>()
                .add(RegisterPasswordChanged(passwordFormControl.value));
          },
          textInputAction: TextInputAction.next,
          textInputType: TextInputType.name,
          formName: "password",
          hintText: "Create your password",
          labelText: "Password",
        ),
        const SizedBox(height: 15),
        AppTextField(
          onChanged: (passwordRFormControl) {
            log("asetestrtre000");
            context
                .read<RegisterBloc>()
                .add(RegisterPasswordRepeatChanged(passwordRFormControl.value));
          },
          textInputAction: TextInputAction.next,
          textInputType: TextInputType.name,
          formName: "passwordRepeat",
          hintText: "Repeat your password",
          labelText: "Repeat Password",
        ),
      ]),
    );
  }
}
