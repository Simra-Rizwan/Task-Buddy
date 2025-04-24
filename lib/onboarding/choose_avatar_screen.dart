import "package:flutter/material.dart";
import "package:fluttertest/contoller/avatar_controller.dart";
import "package:get/get.dart";

import "../constants/colors.dart";

class ChooseAvatarScreen extends StatelessWidget {
  final AvatarController controller = Get.put(AvatarController());

  final List<String> avatarPaths = List.generate(
    12,
    (index) => 'assets/images/avatars/avatar_${index + 1}.png',
  );
  final int defaultAvatarIndex = 0;

  @override
  Widget build(BuildContext context) {
    // Set the default avatar if not selected
    controller.selectedAvatarIndex.value = defaultAvatarIndex;
    return Scaffold(
      backgroundColor: AppColors.secondary,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Choose avatar for profile Image",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Baloo2",
                  ),
                ),
              ),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Choose an avatar to customize your profile.",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Baloo2",
                  ),
                ),
              ),
              SizedBox(height: 20,),
              //Selected Avatar
              Obx(
                    () => Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.white, // Outer white frame
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: EdgeInsets.all(6), // Padding around inner container
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200, // light grey background
                      borderRadius: BorderRadius.circular(14),
                    ),
                    padding: EdgeInsets.all(6), // optional padding to give space around inner avatar
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.grey.shade200, // Grey background
                        image: DecorationImage(
                          image: AssetImage(
                            avatarPaths[controller.selectedAvatarIndex.value],
                          ),
                          fit: BoxFit.contain, // Keeps grey background around the image
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Get.snackbar("Selected", "Avatar has been selected");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.orange,
                  padding: EdgeInsets.symmetric(horizontal: 80, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text("Save", style: TextStyle(color: Colors.black)),
              ),
              SizedBox(height: 20),

              // Avatar section inside grey container
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.grey,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                      childAspectRatio: 1,
                    ),
                    itemCount: avatarPaths.length,
                    itemBuilder: (context, index) {
                      return Obx(() {
                        final isSelected = controller.selectedAvatarIndex.value == index;
                        return GestureDetector(
                          onTap: () => controller.selectAvatar(index),
                          child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                // Outer light grey container
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade200, // light grey background
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                  padding: EdgeInsets.all(6), // optional padding to give space around inner avatar
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: Colors.white,
                                      border: Border.all(
                                        color: isSelected ? Colors.amber : Colors.grey.shade300,
                                        width: 2,
                                      ),
                                      image: DecorationImage(
                                        image: AssetImage(avatarPaths[index]),
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ),
                                // Checkbox icon
                                Positioned(
                                  bottom: 6,
                                  child: CircleAvatar(
                                    radius: 10,
                                    backgroundColor: Colors.white,
                                    child: Icon(
                                      isSelected ? Icons.check_circle : Icons.circle_outlined,
                                      color: isSelected ? AppColors.orange: Colors.grey,
                                      size: 16,
                                    ),
                                  ),
                                ),
                              ],
                          ),
                        );
                      });
                    },
                  ),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
