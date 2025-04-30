import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screens/onboarding/choose_avatar_screen.dart';


class CodeScreenController extends GetxController {
  final List<TextEditingController> codeScreenControllers = List.generate(
    6,
    (_) => TextEditingController(),
  );

  // FocusNode manage the focus on selected field
  final List<FocusNode> focusNodes = List.generate(6, (_) => FocusNode());
  @override
  // onClose is used that no memory is missed
  void onClose() {
    for (var controller in codeScreenControllers) {
      controller.dispose();
    }
    for (var node in focusNodes) {
      node.dispose();
    }
    super.onClose();
  }

  //this method is called when user type or delete from field
  void onChanged(String value, int index) {
    if (value.length == 1 && index < 5) {
      focusNodes[index + 1].requestFocus(); // Move to next field
    } else if (value.isEmpty && index > 0) {
      focusNodes[index - 1].requestFocus(); //Go back if empty
    }
  }

  // check that all fields are field
  void submitCode() {
    bool allFilled = codeScreenControllers.every(
      (c) => c.text.trim().isNotEmpty,
    );
    if (allFilled) {
      Get.to(() => ChooseAvatarScreen());
    }
    else {
      Get.snackbar(
          "Incomplete",
          "Please enter 6 digit code",
          backgroundColor: Colors.redAccent,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM
      );
    }
    }
  }
