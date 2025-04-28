import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/colors.dart';
import '../../controller/edit_profile_controller.dart';

class ProfileDropdownField extends StatelessWidget {
  final String hint;
  final EditProfileController controller;

  const ProfileDropdownField({
    required this.hint,
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => DropdownButtonFormField<String>(
        value: controller.gender.value.isEmpty ? null : controller.gender.value,
        onChanged: (value) {
          if (value != null) {
            controller.gender.value = value;
          }
        },
        items: ["Male", "Female", "Other"]
            .map((gender) => DropdownMenuItem(value: gender, child: Text(gender)))
            .toList(),
        decoration: InputDecoration(
          hintText: hint,
          filled: true,
          fillColor: AppColors.white,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: AppColors.orange),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: AppColors.orange),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        ),
      ),
    );
  }
}
