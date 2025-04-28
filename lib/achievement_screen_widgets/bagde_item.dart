import 'dart:math';
import 'package:flutter/material.dart';
import '../../constants/colors.dart';

class BadgeItem extends StatelessWidget {
  final String label;
  final String imagePath;
  final bool isLocked;
  final String? lockImagePath;

  const BadgeItem({
    required this.label,
    required this.imagePath,
    required this.isLocked,
    this.lockImagePath,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Transform.rotate(
          angle: pi / 4,
          child: Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: AppColors.grey,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Transform.rotate(
                    angle: -pi / 4,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset(
                          imagePath,
                          width: 49,
                          height: 49,
                          fit: BoxFit.contain,
                        ),
                        if (isLocked && lockImagePath != null)
                          Image.asset(
                            lockImagePath!,
                            width: 38,
                            height: 38,
                            fit: BoxFit.contain,
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 15.0),
        if (!isLocked)
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              fontFamily: 'Baloo2',
            ),
          ),
      ],
    );
  }
}
