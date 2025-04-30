import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../constant/colors/AppColors.dart';
import '../screens/HomeScreen.dart';

class AddAwardController extends GetxController {
  final TextEditingController awardNameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  // Add observable for picked image
  Rx<File?> selectedImage = Rx<File?>(null);

  final ImagePicker _picker = ImagePicker();
  //
  final RxBool showBlur = false.obs; // Add this line at the top


  @override
  void onClose() {
    awardNameController.dispose();
    descriptionController.dispose();
    super.onClose();
  }



  void submitAward() {

    if(selectedImage.value == null){
      Get.snackbar('Image Required',
          'Please upload an image before submitting.',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      colorText: Colors.black,
      margin:  const EdgeInsets.all(12),
      );
    return;
    }
    print('Award Name: ${awardNameController.text}');
    print('Description: ${descriptionController.text}');
    print('Image: ${selectedImage.value?.path}');


//After Successfull submission
    _showSuccessDialog();


  }


  void _showSuccessDialog() {
    Get.dialog(
      SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              children: [
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: Container(color: Colors.black.withOpacity(0.2)),
                ),
                Center(
                  child: Material( // ✅ Important for avoiding yellow text lines
                    color: Colors.transparent,
                    child: SingleChildScrollView(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxHeight: constraints.maxHeight * 0.9,
                          maxWidth: 350,
                        ),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    width: 60,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        image: AssetImage('assets/images/circular_background.png'),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Image.asset('assets/images/tick.png', width: 20, height: 20),
                                ],
                              ),
                              const SizedBox(height: 20),
                              const Text(
                                'Your request has been submitted!',
                                textAlign: TextAlign.center,
                                textHeightBehavior: TextHeightBehavior(
                                  applyHeightToFirstAscent: false,
                                  applyHeightToLastDescent: false,
                                ),
                                style: TextStyle(
                                  fontFamily: 'Baloo2',
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 20),
                              SizedBox(
                                width: 180,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Get.back();
                                    Get.offAll(() => HomeScreen());
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.PrimaryColor,
                                    padding: const EdgeInsets.symmetric(vertical: 14),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  child: const Text(
                                    'Okay',
                                    style: TextStyle(
                                      fontFamily: 'Baloo2',
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
      barrierDismissible: false,
    );
  }

  void uploadPhoto() {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Take Photo'),
              onTap: () => _pickImage(ImageSource.camera),
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Choose from Gallery'),
              onTap: () => _pickImage(ImageSource.gallery),
            ),
          ],
        ),
      ),
    );
  }



  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      selectedImage.value = File(pickedFile.path);
    }
    Get.back(); // Close bottom sheet
  }

  void removePhoto() {
    selectedImage.value = null;
  }
}
