import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/colors.dart';

class ProfileTextField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;

  const ProfileTextField({
    required this.hint,
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      controller: controller,
      keyboardType: TextInputType.text,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(color: AppColors.grey),
          filled: true,
          fillColor: AppColors.white.withOpacity(0.5),
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
    );
  }
}
