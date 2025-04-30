import 'package:flutter/material.dart';
import 'package:fluttertest/constants/colors.dart';
import 'package:fluttertest/controller/achievement_controller.dart';
import 'package:get/get.dart';
import '../widgets/achievement_screen_widgets/badget_grid.dart';

class AchievementScreen extends StatelessWidget {
  final AchievementController controller = Get.put(AchievementController());

  AchievementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
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
          centerTitle: true,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            const Text(
              "Current badges",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                fontFamily: "Baloo2",
              ),
            ),
            const SizedBox(height: 20),
            const BadgesGrid(isLocked: false),
            const SizedBox(height: 12.0),
            const Text(
              'Locked badges',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                fontFamily: 'Baloo2',
              ),
            ),
            const SizedBox(height: 20),
            const BadgesGrid(isLocked: true),
          ],
        ),
      ),
    );
  }
}
