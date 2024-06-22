import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_mania/business_logic/auth/register/register_bloc.dart';

import 'package:shop_mania/core/constant/enums.dart';
import 'package:shop_mania/core/theme.dart';
import 'package:shop_mania/core/widgets/loading.dart';
import 'package:shop_mania/presentation/auth/widgets/pin_input_field_code_widget.dart';

import '../../core/widgets/app_bar_widget.dart';

class VerificationCodeScreen extends StatefulWidget {
  const VerificationCodeScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return VerificationCodeScreenState();
  }
}

class VerificationCodeScreenState extends State<VerificationCodeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SharedAppBarWidget(
        title: "Verification",
      ),
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
                  Container(
                    width: 120.0,
                    height: 120.0,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: ConstColors.fieldFilled),
                    child: Center(
                      child: Container(
                        width: 80.0,
                        height: 80.0,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: ConstColors.primary),
                        child: const Icon(
                          Icons.mark_email_read,
                          color: ConstColors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: Text("Verification code",
                        style: Theme.of(context).textTheme.titleLarge),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: Text("We have to sent the code verification to",
                        style: Theme.of(context).textTheme.bodyMedium),
                  ),
                  Center(
                    child: Text("We have to sent the code verification to",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: ConstColors.displayLarge)),
                  ),
                  const SizedBox(height: 30),
                  const PinInputFieldCodeWidget(),
                  const SizedBox(height: 30),
                  ElevatedButton(
                      onPressed: () {
                        showModalBottomSheet(
                            enableDrag: true,
                            showDragHandle: true,
                            context: context,
                            builder: (context) => Container(
                                  decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.horizontal(
                                          left: Radius.circular(20),
                                          right: Radius.circular(20))),
                                  child: ListView(
                                    padding: const EdgeInsets.all(20),
                                    children: [
                                      Container(
                                        width: 120.0,
                                        height: 120.0,
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: ConstColors.fieldFilled),
                                        child: Center(
                                          child: Container(
                                            width: 80.0,
                                            height: 80.0,
                                            decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: ConstColors.green),
                                            child: const Icon(
                                              Icons.mark_email_read,
                                              color: ConstColors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                      Center(
                                        child: Text("Register success",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleLarge),
                                      ),
                                      const SizedBox(height: 20),
                                      Center(
                                        child: Text(
                                            "We have to sent the code verification to",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium),
                                      ),
                                      const SizedBox(height: 30),
                                      ElevatedButton(
                                          onPressed: () {},
                                          child: const Text("Go to home page"))
                                    ],
                                  ),
                                ));
                      },
                      child: const Text("Submit")),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Didn't receive the code?",
                          style: Theme.of(context).textTheme.bodyMedium),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed(
                              '/LoginScreen',
                            );
                          },
                          child: const Text("Resend")),
                    ],
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
