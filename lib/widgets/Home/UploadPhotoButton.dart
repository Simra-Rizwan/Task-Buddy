import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../controller/add_award_controller.dart';

class UploadPhotoContainer extends StatelessWidget {
  final AddAwardController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.selectedImage.value == null) {
        return GestureDetector(
          onTap: controller.uploadPhoto,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.PrimaryColor, width: 0.5),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/upload_photo_icon.png',
                  width: 20,
                  height: 20,
                ),
                const SizedBox(width: 8),
                const Text(
                  'Upload Photo',
                  style: TextStyle(fontFamily: 'Baloo2', fontSize: 16),
                ),
              ],
            ),
          ),
        );
      } else {
        return Stack(
          children: [
            Container(
              width: double.infinity,
              height: 220,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey.shade200.withOpacity(0.5),
                image: DecorationImage(
                  image: FileImage(controller.selectedImage.value!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 8,
              right: 8,
              child: GestureDetector(
                onTap: controller.removePhoto,


                child:Image.asset(
                    'assets/images/delete.png',
                    width: 28,
                    height: 28
                ),




              ),
            ),
          ],
        );
      }
    });
  }
}
