import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertest/constants/colors.dart';
import 'package:fluttertest/widget/edit_profile/date_formatter.dart';

class DateTextField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;

  DateTextField({required this.hint, required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(10),
        DateFormatter(),
      ],
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
