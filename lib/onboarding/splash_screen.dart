import "package:flutter/material.dart";
import "package:fluttertest/onboarding/onboarding_screen.dart";
import "package:get/get.dart";
import "../constants/colors.dart";

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3),() {
      Get.off(() => OnboardingScreen());
    });
    return Scaffold(
      backgroundColor: AppColors.orange,
      body: Center(
        child: Text(
          "Task Buddy",
          style: TextStyle(
            fontFamily: 'Baloo2',fontSize: 40, fontWeight:FontWeight.w700,),
          ),
        ),
      );
  }
}
