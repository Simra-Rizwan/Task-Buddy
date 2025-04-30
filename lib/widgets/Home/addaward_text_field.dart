import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class AddAwardTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isMultiLine;
  final int maxLines;

  const AddAwardTextField({
    super.key,
    required this.controller,
    this.hintText = '',
    this.isMultiLine = false,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.PrimaryColor, width: 0.5),
      ),
      child: TextField(
        controller: controller,
        maxLines: isMultiLine ? 5 : maxLines,
        minLines: isMultiLine ? 3 : 1,
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
          hintStyle: TextStyle(
            color: Colors.grey.shade500,
            fontSize: 16,
          ),
        ),
        style: const TextStyle(
          fontSize: 16,
          color: Colors.black,
        ),
      ),
    );
  }
}