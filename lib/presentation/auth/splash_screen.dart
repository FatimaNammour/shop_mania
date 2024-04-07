import 'package:flutter/material.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:shop_mania/core/theme.dart';
import 'package:shop_mania/presentation/auth/onboarding_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.asset('assets/carts.png'),
      title: const Text(
        "Any shopping just from home",
        style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: ConstColors.white),
      ),
      backgroundColor: ConstColors.primary,
      showLoader: false,
      loadingText: const Text("Version 0.0.1"),
      navigator: const OnboardingScreen(),
      durationInSeconds: 2,
    );
  }
}
