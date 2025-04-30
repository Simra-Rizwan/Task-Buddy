import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/achievement_controller.dart';
import 'bagde_item.dart';

class BadgesGrid extends StatelessWidget {
  final bool isLocked;

  const BadgesGrid({
    required this.isLocked,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AchievementController>();

    return Obx(() {
      final badges = isLocked
          ? controller.lockedBadges
          : controller.currentBadges;

      return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: isLocked ? 1 : 0.75,
        ),
        itemCount: badges.length,
        itemBuilder: (context, index) {
          var badge = badges[index];
          return BadgeItem(
            label: isLocked ? '' : badge['title'] ?? '',
            imagePath: badge['image'] ?? badge['badgeImage'] ?? '',
            lockImagePath: isLocked ? badge['lockImage'] : null,
            isLocked: isLocked,
          );
        },
      );
    });
  }
}
