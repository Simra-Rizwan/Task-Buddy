import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertest/controller/achievement_controller.dart';
import 'package:get/get.dart';

import 'Details/details_screen.dart';
import 'constants/colors.dart';

class AchievementScreen extends StatelessWidget {
  final AchievementController controller = Get.put(AchievementController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          backgroundColor: AppColors.secondary,
          elevation: 0,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: Text(
              'Achievement',
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
              width: 36,
              height: 36,
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
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0, top: 18.0),
              child: Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: IconButton(
                  icon: const Icon(Icons.arrow_forward, color: AppColors.orange),
                  onPressed: () {
                    Get.to(() => DetailsScreen()); // Navigate to detail screen
                  },
                  padding: EdgeInsets.zero,
                ),
              ),
            ),
          ],
          centerTitle: true,
        ),
      ),

      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Text(
              "Current badges",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                fontFamily: "Baloo2",
              ),
            ),
            SizedBox(height: 20),
            Obx(
              () => Container(
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    childAspectRatio: 0.75,
                  ),
                  itemCount: controller.currentBadges.length,
                  itemBuilder: (context, index) {
                    var badge =
                        controller.currentBadges[index] as Map<String, String>;
                    return SizedBox(
                      height: 140,
                      child: badgesItem(
                        label: badge['title'] ?? '',
                        imagePath: badge['image'] ?? '',
                        isLocked: false,
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: 12.0),
            Text(
              'Locked badges',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                fontFamily: 'Baloo2',
              ),
            ),
            SizedBox(height: 20),
            Obx(
              () => GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  childAspectRatio: 1,
                ),
                itemCount: controller.lockedBadges.length,
                itemBuilder: (context, index) {
                  var badge = controller.lockedBadges[index];
                  return badgesItem(
                    label: '',
                    imagePath:  badge['badgeImage'] ?? '',
                    lockImagePath: badge['lockImage'] ?? '',
                    isLocked: true,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget badgesItem({
    required String label,
    required String imagePath,
    required bool isLocked,
    String? lockImagePath,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Transform.rotate(
          angle: pi / 4, // outer rotation
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
                    angle: -pi / 4, // un-rotate image, not the container
                    child:  Stack(
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
                          lockImagePath,
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
        SizedBox(height: 15.0),
        if (!isLocked)
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              fontFamily: 'Baloo2',
            ),
          ),
      ],
    );
  }
}
