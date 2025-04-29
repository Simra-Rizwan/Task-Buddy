import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileController extends GetxController {
  final TextEditingController awardName = TextEditingController();
  final TextEditingController relation = TextEditingController();
  final TextEditingController age = TextEditingController();
  final TextEditingController dob = TextEditingController();

  RxString gender = ''.obs;
}
