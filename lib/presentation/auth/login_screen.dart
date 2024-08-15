import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:shop_mania/business_logic/auth/login/login_bloc.dart';

import 'package:shop_mania/core/constant/enums.dart';
import 'package:shop_mania/core/theme.dart';
import 'package:shop_mania/core/widgets/toast.dart';
import 'package:shop_mania/presentation/auth/widgets/login_form_widget.dart';

import '../../core/widgets/app_text_field.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return SignInPageState();
  }
}

class SignInPageState extends State<SignInPage> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<LoginBloc, LoginState>(
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
              CustomToast.showError(context.read<LoginBloc>().error);
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
            return Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ListView(children: [
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
                              // showModalBottomSheet(
                              //     enableDrag: true,
                              //     showDragHandle: true,
                              //     context: context,
                              //     builder: (contextt) => Container(
                              //           decoration: const BoxDecoration(
                              //               borderRadius: BorderRadius.horizontal(
                              //                   left: Radius.circular(20),
                              //                   right: Radius.circular(20))),
                              //           child: ListView(
                              //             padding: const EdgeInsets.all(20),
                              //             children: [
                              //               Center(
                              //                 child: Text("Forget password",
                              //                     style: Theme.of(context)
                              //                         .textTheme
                              //                         .titleLarge),
                              //               ),
                              //               const SizedBox(height: 20),
                              //               Center(
                              //                 child: Text(
                              //                     "Enter your emaidl or phone number",
                              //                     style: Theme.of(context)
                              //                         .textTheme
                              //                         .bodyMedium),
                              //               ),
                              //               const SizedBox(height: 30),
                              //               ReactiveForm(
                              //                 formGroup: context
                              //                     .read<LoginBloc>()
                              //                     .sendCodeform,
                              //                 child: Column(
                              //                   crossAxisAlignment:
                              //                       CrossAxisAlignment.start,
                              //                   children: [
                              //                     Text("Email",
                              //                         style: Theme.of(context)
                              //                             .textTheme
                              //                             .displayLarge!
                              //                             .copyWith(
                              //                                 fontSize: 18)),
                              //                     AppTextField(
                              //                       fieldfocusNode: FocusNode(),
                              //                       onFocus: () {
                              //                         log("onFocus");
                              //                       },
                              //                       onChanged:
                              //                           (emailFormControl) {
                              //                         log("asetestrtre000");
                              //                         context
                              //                             .read<LoginBloc>()
                              //                             .add(LoginEmailChanged(
                              //                                 emailFormControl
                              //                                     .value));
                              //                       },
                              //                       textInputAction:
                              //                           TextInputAction.next,
                              //                       textInputType:
                              //                           TextInputType.name,
                              //                       formName: "email",
                              //                       hintText: "Create your Email",
                              //                       prefixIcon: const Icon(
                              //                         Icons.email_outlined,
                              //                         color: ConstColors
                              //                             .displaySmall,
                              //                       ),
                              //                     ),
                              //                   ],
                              //                 ),
                              //               ),
                              //               const SizedBox(height: 30),
                              //               ElevatedButton(
                              //                   onPressed: () {},
                              //                   child: const Text("Send code"))
                              //             ],
                              //           ),
                              //         ));

                              showModalBottomSheet(
                                  enableDrag: true,
                                  showDragHandle: true,
                                  isScrollControlled: true,
                                  context: context,
                                  builder: (contextt) => FractionallySizedBox(
                                        heightFactor: 0.9,
                                        child: Container(
                                          decoration: const BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.horizontal(
                                                      left: Radius.circular(20),
                                                      right:
                                                          Radius.circular(20))),
                                          child: ListView(
                                            padding: const EdgeInsets.all(20),
                                            children: [
                                              Center(
                                                child: Text(
                                                    "Create new password",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .titleLarge),
                                              ),
                                              const SizedBox(height: 20),
                                              Center(
                                                child: Text(
                                                    "Enter your new password",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyMedium),
                                              ),
                                              const SizedBox(height: 30),
                                              ReactiveForm(
                                                formGroup: context
                                                    .read<LoginBloc>()
                                                    .sendCodeform,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text("password",
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .displayLarge!
                                                            .copyWith(
                                                                fontSize: 18)),
                                                    AppTextField(
                                                      fieldfocusNode:
                                                          FocusNode(),
                                                      onFocus: () {
                                                        log("onFocus");
                                                      },
                                                      onChanged:
                                                          (emailFormControl) {
                                                        log("asetestrtre000");
                                                        context
                                                            .read<LoginBloc>()
                                                            .add(LoginEmailChanged(
                                                                emailFormControl
                                                                    .value));
                                                      },
                                                      textInputAction:
                                                          TextInputAction.next,
                                                      textInputType:
                                                          TextInputType.name,
                                                      formName: "password",
                                                      hintText:
                                                          "Enter your new password",
                                                      prefixIcon: const Icon(
                                                        Icons.lock_outline,
                                                        color: ConstColors
                                                            .displaySmall,
                                                      ),
                                                      suffixIcon: const Icon(Icons
                                                          .remove_red_eye_outlined),
                                                    ),
                                                    const SizedBox(height: 30),
                                                    Text("Repeate password",
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .displayLarge!
                                                            .copyWith(
                                                                fontSize: 18)),
                                                    AppTextField(
                                                      fieldfocusNode:
                                                          FocusNode(),
                                                      onFocus: () {
                                                        log("onFocus");
                                                      },
                                                      onChanged:
                                                          (emailFormControl) {
                                                        log("asetestrtre000");
                                                        context
                                                            .read<LoginBloc>()
                                                            .add(LoginEmailChanged(
                                                                emailFormControl
                                                                    .value));
                                                      },
                                                      textInputAction:
                                                          TextInputAction.next,
                                                      textInputType:
                                                          TextInputType.name,
                                                      formName:
                                                          "passwordRepeat",
                                                      hintText:
                                                          "Repeat your password",
                                                      prefixIcon: const Icon(
                                                        Icons.lock_outline,
                                                        color: ConstColors
                                                            .displaySmall,
                                                      ),
                                                      suffixIcon: const Icon(Icons
                                                          .remove_red_eye_outlined),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(height: 30),
                                              ElevatedButton(
                                                  onPressed: () {
                                                    Navigator.of(context)
                                                        .pushNamed(
                                                      '/MainHomeScreen',
                                                    );
                                                  },
                                                  child: const Text(
                                                      "Change password"))
                                            ],
                                          ),
                                        ),
                                      ));
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
            );
          },
        ),
      ),
    );
  }
}
