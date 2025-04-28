import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/colors.dart';

class ProfileTextField extends StatelessWidget {
  final String hint;
  final RxString controllerText;

  const ProfileTextField({
    required this.hint,
    required this.controllerText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => TextFormField(
        initialValue: controllerText.value,
        onChanged: (value) => controllerText.value = value,
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
