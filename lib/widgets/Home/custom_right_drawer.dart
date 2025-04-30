import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_buddy/constant/colors/AppColors.dart';
import 'package:task_buddy/controller/drawer_controller.dart';
import 'package:task_buddy/widgets/Home/drawer_item.dart';
import 'package:task_buddy/widgets/Home/showLogoutBottomSheet.dart';

class CustomRightDrawer extends StatelessWidget {
  const CustomRightDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the controller
    final CustomDrawerController controller = Get.find();

    // Detect swipe direction
    return GestureDetector(
      onHorizontalDragEnd: (details) {

        if (details.primaryVelocity != null && details.primaryVelocity! > 0) {
          Get.back();
        }
      },

      child: Drawer(

        width: MediaQuery.of(context).size.width * 0.7, // Set drawer width to 70% of screen
        backgroundColor: Colors.grey,

        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(40), // Rounded bottom-left corner
          ),
        ),

          child: Container(



    decoration: BoxDecoration(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(40), // <-- your bottom-left radius
      ),
    border: Border(
    left: BorderSide(
    color: AppColors.PrimaryColor, // ← your primary color
    width: 2,                      // ← left stroke width
    ),

    ),
    ),
            child: Column(
              children: [
                // Drawer Header (Optional, can be removed if not needed)
                const SizedBox(height: 50), // Space at the top

                // Menu Items
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.only(left: 42, top: 0, right: 0, bottom: 0),
                    children: [
                      _buildDrawerItem(
                        imagePath: 'assets/images/add_award.png',
                        title: 'Add award',
                        onTap: controller.navigateToAddAward,
                      ),
                      _buildDrawerItem(
                        imagePath: 'assets/images/cash_epic.png',
                        title: 'Cash epic dollar',
                        onTap: controller.navigateToCashEpicDollar,
                      ),
                      _buildDrawerItem(
                        imagePath: 'assets/images/my_task_drawer.png',
                        title: 'My tasks',
                        onTap: controller.navigateToMyTasks,
                      ),
                      _buildDrawerItem(
                        imagePath: 'assets/images/reward_store.png',
                        title: 'Reward store',
                        onTap: controller.navigateToRewardStore,
                      ),
                      _buildDrawerItem(
                        imagePath: 'assets/images/achievements.png',
                        title: 'Achievements & badges',
                        onTap: controller.navigateToAchievements,
                      ),
                      _buildDrawerItem(
                        imagePath: 'assets/images/chatttttt.png',
                        title: 'Chat',
                        onTap: controller.navigateToChat,
                      ),
                      _buildDrawerItem(
                        imagePath: 'assets/images/notification_drawer.png',
                        title: 'Notification',
                        onTap: controller.navigateToNotifications,
                      ),
                      _buildDrawerItem(
                        imagePath: 'assets/images/history.png',
                        title: 'History',
                        onTap: controller.navigateToHistory,
                      ),
                      _buildDrawerItem(
                        imagePath: 'assets/images/profile_customization.png',
                        title: 'Profile & customization',
                        onTap: controller.navigateToProfile,
                      ),


                      SizedBox(height: 30),
                      // Logout item inside ListView now
                      _buildDrawerItem(
                        imagePath: 'assets/images/logout.png',
                        title: 'Logout',
                        onTap: () {
                          Get.back();
                          Future.delayed(const Duration(milliseconds: 300), () {
                            showLogoutBottomSheet(controller.logout);
                          });
                        },
                        textColor: Colors.red,
                        iconColor: Colors.red,
                      ),
                    ],

                  ),
                ),
              ],
            ),
          ),



      ),
    );
  }
}


Widget _buildDrawerItem({
  IconData? icon, //
  String? imagePath,
  required String title,
  required VoidCallback onTap,
  Color? textColor,
  Color? iconColor,
}) {
  return Container(
      clipBehavior: Clip.antiAlias,
    margin: const EdgeInsets.symmetric(vertical: 4).copyWith(left: 10, right: 1,bottom: 10),
    decoration: const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16),
        bottomLeft: Radius.circular(16),
      ),
    ),
    child: DrawerItem(
      icon: icon,
      imagePath: imagePath,
      title: title,
      onTap: onTap,
      textColor: textColor,
      iconColor: iconColor,
    ),
  );
}