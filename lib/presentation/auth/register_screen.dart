import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shop_mania/business_logic/auth/register/register_bloc.dart';
import 'package:shop_mania/core/constant/enums.dart';

import '../../core/widgets/toast.dart';
import 'widgets/register_form_widget.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return SignUpPageState();
  }
}

class SignUpPageState extends State<SignUpPage> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<RegisterBloc, RegisterState>(
        listener: (context, state) {
          log("state from listener");
          log(state.status.toString());

          if (state.status == SubmissionStatus.failed) {
            _isLoading = false;
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                const SnackBar(content: Text('Authentication Failure')),
              );
            CustomToast.showError(context.read<RegisterBloc>().error);
          }
          if (state.status == SubmissionStatus.dataMissing) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                const SnackBar(content: Text('Please check your data')),
              );
          }
          if (state.status == SubmissionStatus.inProgress) {
            _isLoading = true;
          }
          if (state.status == SubmissionStatus.success) {
            Navigator.of(context).pushNamed(
              '/MainHomeScreen',
            );
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ListView(children: [
                    const SizedBox(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Create Account",
                            style: Theme.of(context).textTheme.titleLarge),
                        const SizedBox(height: 15),
                        Text("Start learning with create your account",
                            style: Theme.of(context).textTheme.titleMedium),
                      ],
                    ),
                    const SizedBox(height: 40),
                    RegisterForm(
                      registerBloc: context.read<RegisterBloc>(),
                    ),
                    const SizedBox(height: 30),
                    Center(
                      child: Column(
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                log("here from button");
                                context
                                    .read<RegisterBloc>()
                                    .add(const RegisterSubmitted());
                              },
                              child: const Text("Create Account")),
                          const SizedBox(height: 15),
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
                                '/VerificationCodeScreen',
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
                  ]),
                ),
                if (_isLoading)
                  const Opacity(
                    opacity: 0.8,
                    child:
                        ModalBarrier(dismissible: false, color: Colors.black),
                  ),
                if (_isLoading)
                  const Center(
                    child: CircularProgressIndicator(),
                  ),
              ],
            ),
          );
        },
        // buildWhen: (previous, current) {
        //   if (previous.status == SubmissionStatus.failed &&
        //       current.status == SubmissionStatus.dataMissing) {
        //     return false;
        //   } else {
        //     return true;
        //   }
        // },
      ),
    );
  }
}
