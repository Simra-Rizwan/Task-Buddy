import "package:flutter/material.dart";
import "package:fluttertest/screens/onboarding/select_role_screen.dart";
import "package:get/get.dart";

import "../../constants/colors.dart";

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 300,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/task_buddy_image.PNG"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 70),
          //Title
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              "Hey, Let’s have fun with tasks",
              style: TextStyle(fontFamily: 'Baloo2',fontSize: 20, fontWeight:FontWeight.w600),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
              style: TextStyle(fontFamily: 'Baloo2',fontSize: 14, fontWeight:FontWeight.w500),
              textAlign: TextAlign.center,
            ),
          ),
          //Start Button
          Padding(
            padding: EdgeInsets.symmetric(vertical: 40.0, horizontal: 32.0),
            child: SizedBox(
              width: double.infinity,
              height: 40.0,
              child: ElevatedButton(
                onPressed: ()=> Get.offAll(()=>SelectRoleScreen()),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text("Start Now", style: TextStyle(fontSize: 16,color: Colors.black),),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
