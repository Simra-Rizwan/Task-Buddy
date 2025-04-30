import 'package:get/get.dart';
import 'package:task_buddy/screens/ChatScreen.dart';
import 'package:task_buddy/screens/NotificationScreen.dart';
import 'package:task_buddy/screens/RewardStoreScreen.dart';

import '../screens/AddAwardScreen.dart';
import '../screens/MyTasksScreen.dart';
import '../widgets/Home/task_list_widget.dart';

class CustomDrawerController extends GetxController {
  // controll drawer open/close
  var isDrawerOpen= false.obs;
  void toggleDrawer(){
    isDrawerOpen.value=!isDrawerOpen.value;
  }

  void closeDrawer(){
    isDrawerOpen.value=false;
  }


  // Navigation methods for each drawer item
  void navigateToAddAward() {
    Get.back(); // Close drawer
    Future.delayed(const Duration(milliseconds: 300), () {
      Get.to(() => const AddAwardScreen());
    });
  }

  void navigateToCashEpicDollar() {
    Get.back();
    // Add navigation logic here
  }

  void navigateToMyTasks() {
    Get.back();
    // Add navigation logic here
    Future.delayed(const Duration(milliseconds: 300), (){
      Get.to(() => MyTasksScreen());
    });


  }

  void navigateToRewardStore() {
    Get.back();
    // Add navigation logic here
    Future.delayed(const Duration(milliseconds: 300), (){
      Get.to(()=> RewardStoreScreen());
    });
  }

  void navigateToAchievements() {
    Get.back();
    // Add navigation logic here
  }

  void navigateToChat() {
    Get.back();
    // Add navigation logic here
    Future.delayed(const Duration( milliseconds: 300), (){
      Get.to( () => ChatScreen());
    });
  }

  void navigateToNotifications() {
    Get.back();
Future.delayed(const Duration(milliseconds: 300), (){
  Get.to( () => NotificationScreen());
});

  }

  void navigateToHistory() {
    Get.back();
    // Add navigation logic here
  }

  void navigateToProfile() {
    Get.back();
    // Add navigation logic here
  }

  void logout() {
    Get.back();
    // Add logout logic here, e.g., clear user session, navigate to login screen
  }
}