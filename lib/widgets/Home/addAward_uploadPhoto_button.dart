import 'package:flutter/material.dart';
import 'package:task_buddy/constant/colors/AppColors.dart';

class UploadPhotoButton extends StatelessWidget {
  final VoidCallback onTap;

  const UploadPhotoButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity, // full width like award name field
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: AppColors.PrimaryColor,
            width: 0.5,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center, // center content
          children: [
            Image.asset(
              'assets/images/upload_photo_icon.png',
              width: 20,
              height: 20,
            ),
            const SizedBox(width: 8),
            const Text(
              'Upload Photo',
              style: TextStyle(
                fontFamily: 'Baloo2',
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
