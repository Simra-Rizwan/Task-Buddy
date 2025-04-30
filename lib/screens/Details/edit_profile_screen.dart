import 'package:flutter/material.dart';
import 'package:fluttertest/screens/HomeScreen.dart';
import 'package:get/get.dart';
import '../../constants/colors.dart';
import '../../controller/edit_profile_controller.dart';
import '../../widgets/edit_profile/date_text_field.dart';
import '../../widgets/edit_profile/edit_profile_image.dart';
import '../../widgets/edit_profile/profile_dropdown_field.dart';
import '../../widgets/edit_profile/profile_text_field.dart';

class EditProfileScreen extends StatelessWidget {
  final controller = Get.put(EditProfileController());

  EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      appBar: AppBar(
        backgroundColor: AppColors.secondary,
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        title: const Padding(
          padding: EdgeInsets.only(top: 18.0),
          child: Text(
            'Edit details',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              fontFamily: "Baloo2",
            ),
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 18.0),
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: AppColors.orange),
              onPressed: () => Get.back(),
              padding: EdgeInsets.zero,
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 5),
              const EditProfileImage(),
              const SizedBox(height: 20),
              _buildHeading("Award name"),
              const SizedBox(height: 5),
              ProfileTextField(hint: "Remote car", controller: controller.awardName),
              const SizedBox(height: 15),
              _buildHeading("Relation with parent"),
              const SizedBox(height: 5),
              ProfileTextField(hint: "Daughter", controller: controller.relation),
              const SizedBox(height: 15),
              _buildHeading("Age"),
              const SizedBox(height: 5),
              ProfileTextField(hint: "12 years", controller: controller.age),
              const SizedBox(height: 15),
              _buildHeading("Gender"),
              const SizedBox(height: 5),
              ProfileDropdownField(hint: "Male", controller: controller),
              const SizedBox(height: 15),
              _buildHeading("Date of birth"),
              const SizedBox(height: 5),
              DateTextField(hint: "dd/mm/yyyy", controller: controller.dob),
              const SizedBox(height: 20),
              Center(
                child: SizedBox(
                  width: 156,
                  height: 40,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: AppColors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    onPressed: () {
                      Get.to(()=> HomeScreen());
                    },
                    child: const Text(
                      "Save",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Baloo2",
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

  Text _buildHeading(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        fontFamily: "Baloo2",
        color: AppColors.black,
      ),
    );
  }
}
