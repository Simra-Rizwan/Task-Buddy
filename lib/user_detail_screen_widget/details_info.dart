import 'package:flutter/material.dart';
import '../../constants/colors.dart';

class DetailsInfo extends StatelessWidget {
  final String title;
  final String value;

  const DetailsInfo({
    required this.title,
    required this.value,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Baloo2",
                  color: AppColors.black,
                ),
              ),
              TextSpan(
                text: value,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Baloo2",
                  color: AppColors.black,
                ),
              ),
            ],
          ),
        ),
        const Divider(
          color: AppColors.orange,
          thickness: 1,
          indent: 2,
          endIndent: 2,
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
