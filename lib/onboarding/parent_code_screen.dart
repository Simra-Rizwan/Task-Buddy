import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertest/constants/colors.dart';
import 'package:get/get.dart';
import '../controller/code_screen_controller.dart';

class ParentCodeScreen extends StatelessWidget {
  final CodeScreenController controller = Get.put(CodeScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
        resizeToAvoidBottomInset: true, // allow screen to move up
      body: SafeArea(
        child: SingleChildScrollView( // Makes screen scrollable
        reverse: true, // Keeps bottom elements in view when keyboard shows
    child: Padding(
        padding: EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/parent_code_image.png",
              height: 358,
              width: 358,
            ),
            SizedBox(height: 15),
            Text(
              "Enter Parent Code",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                fontFamily: "Baloo2",
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Ask your parent for the unique code to join task buddy",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                fontFamily: "Baloo2",
              ),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                6,
                (index) => Container(
                  height: 38,
                  width: 37,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.orange),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextField(
                    controller: controller.codeScreenControllers[index],
                    focusNode: controller.focusNodes[index],
                    maxLength: 1,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18),
                    decoration: InputDecoration(
                      counterText: " ", //hide the text
                      border: InputBorder.none,
                    ),
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    onChanged: (val) => controller.onChanged(val, index),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.orange,
                padding: EdgeInsets.symmetric(horizontal: 90, vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: controller.submitCode,
              child: Text("Next", style: TextStyle(color: Colors.black)),
            ),
          ],
        ),
      ),
      )
      ),
    );
  }
}
