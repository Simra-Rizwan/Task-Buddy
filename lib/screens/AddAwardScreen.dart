import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/colors.dart';
import '../controller/add_award_controller.dart';
import '../widgets/Home/UploadPhotoButton.dart';
import '../widgets/Home/addaward_text_field.dart';


class AddAwardScreen extends StatelessWidget {
  const AddAwardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the controller
    final AddAwardController controller = Get.put(AddAwardController());

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.SecondaryColor,



      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
         physics: const BouncingScrollPhysics(),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top bar with back arrow and title
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Image.asset(
                        'assets/images/arrow-left.png',
                        width: 24,
                        height: 24,
                      ),
                    ),
                  ),
                  const Expanded(
                    child: Center(
                      child: Text(
                        'Add Award',
                        style: TextStyle(
                          fontFamily: 'Baloo2',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 40), // To balance the back arrow space
                ],
              ),

              const SizedBox(height: 20),

              // Award name
              const Text(
                'Award name',
                style: TextStyle(
                  fontFamily: 'Baloo2',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              AddAwardTextField(
                controller: controller.awardNameController,
                hintText: 'Enter award name',
              ),

              const SizedBox(height: 20),

              // Description
              const Text(
                'Description',
                style: TextStyle(
                  fontFamily: 'Baloo2',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              AddAwardTextField(
                controller: controller.descriptionController,
                hintText: 'Enter description',
                isMultiLine: true,
              ),

              const SizedBox(height: 20),

              // Upload photo
              const Text(
                'Upload photo',
                style: TextStyle(
                  fontFamily: 'Baloo2',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              UploadPhotoContainer(),



           /*   UploadPhotoButton(
                onTap: controller.uploadPhoto,
              ),*/

              const SizedBox(height: 40),

              // Submit button with custom width
              Center(
                child: SizedBox(
                  width: 200, // 🔹 adjust this value to make it wider or narrower
                  child: ElevatedButton(
                    onPressed: controller.submitAward,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.PrimaryColor,
                      padding: const EdgeInsets.symmetric(vertical: 14), // vertical height
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Submit',
                      style: TextStyle(
                        fontFamily: 'Baloo2',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),


              ),


            ],
          ),
        ),
      ),

    );
  }
}