import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_mania/business_logic/auth/login/login_bloc.dart';

import 'package:shop_mania/core/constant/enums.dart';
import 'package:shop_mania/core/widgets/loading.dart';
import 'package:shop_mania/presentation/auth/widgets/login_form_widget.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return SignInPageState();
  }
}

class SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: BlocConsumer<LoginBloc, LoginState>(
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
                      Text("Login Account",
                          style: Theme.of(context).textTheme.titleLarge),
                      const SizedBox(height: 15),
                      Text("Please login with registered account",
                          style: Theme.of(context).textTheme.titleMedium),
                    ],
                  ),
                  const SizedBox(height: 40),
                  const LoginForm(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed(
                              '/LoginScreen',
                            );
                          },
                          child: const Text("Forgot password?")),
                    ],
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                      onPressed: () {
                        context.read<LoginBloc>().add(const LoginSubmitted());
                      },
                      child: const Text("Sign In")),
                  const SizedBox(height: 30),
                  Center(
                    child: Column(children: [
                      Text("Or using other method",
                          style: Theme.of(context).textTheme.bodyMedium),
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
                      const SizedBox(height: 15),
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
                    ]),
                  )
                ]);
              }
            },
          ),
        ),
      ),
    );
  }
}
