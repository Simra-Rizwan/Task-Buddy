import 'package:flutter/material.dart';
import 'package:fluttertest/screens/onboarding/parent_code_screen.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
// Enum for roles
//want to limit a variable to a small, predefined set of values
enum UserRole { child, parent }

// GetX Controller
class RoleController extends GetxController {
  // Rxn It allows selectedRole to hold either a UserRole value or null
  var selectedRole = Rxn<UserRole>();

  void selectRole(UserRole role) {
    selectedRole.value = role;
  }
}

// Main Screen
class SelectRoleScreen extends StatelessWidget {
  final RoleController controller = Get.put(RoleController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
        body: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Select Role",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Baloo2",
                ),
              ),
                SizedBox(height: 10),
                Text(
                  'Choose Your Role - Parent or Child,and \nStart Your Journey Together!',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Baloo2",
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 40),
                Obx(() {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildRoleContainer(
                        role: UserRole.child,
                        label: 'Child',
                        imagePath: 'assets/images/child_image.png',
                        isSelected: controller.selectedRole.value ==
                            UserRole.child,
                        onTap: () => controller.selectRole(UserRole.child),
                      ),
                      SizedBox(width: 20),
                      _buildRoleContainer(
                        role: UserRole.parent,
                        label: 'Parent',
                        imagePath: 'assets/images/parent_image.png',
                        isSelected: controller.selectedRole.value ==
                            UserRole.parent,
                        onTap: () => controller.selectRole(UserRole.parent),
                      ),
                    ],
                  );
                }),
                SizedBox(height: 50),
                ElevatedButton(
                  onPressed: () {
                    if (controller.selectedRole.value != null) {
                      Get.offAll(() => ParentCodeScreen());
                    } else {
                      Get.snackbar("Select Role",
                          "Please select a role before continuing.");
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.orange,
                    padding: EdgeInsets.symmetric(horizontal: 90, vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text("Next", style: TextStyle(fontSize: 16,color: Colors.black)),
                ),
              ],
            ),
          ),
    );
  }

  Widget _buildRoleContainer({
    required UserRole role,
    required String label,
    required String imagePath,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isSelected ? AppColors.orange : AppColors.secondary,
              border: Border.all(
                color: isSelected ? AppColors.orange : AppColors.secondary,
                width: 2,
              ),
            ),
            child: CircleAvatar(
              radius: 65,
              backgroundImage: AssetImage(imagePath),
              backgroundColor: Colors.transparent,
            ),
          ),
          SizedBox(height: 10),
          Container(
            height: 40,
            width: 146,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: isSelected ? AppColors.orange : AppColors.secondary,
              border: Border.all(color: AppColors.orange),
              borderRadius: BorderRadius.circular(40), // pill shape
            ),
            child: Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.black : AppColors.orange,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

