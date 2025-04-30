import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../constant/colors/AppColors.dart';
import '../controller/drawer_controller.dart';
import '../controller/weekly_calendar_controller.dart';
import '../widgets/Home/custom_right_drawer.dart';
import '../widgets/Home/custom_top_bar.dart';
import '../widgets/Home/rewards_section_widget.dart';
import '../widgets/Home/task_list_widget.dart';
import '../widgets/Home/weekly_calendar_widget.dart';
import 'RewardStoreScreen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final CustomDrawerController drawerController = Get.put(CustomDrawerController());

  @override
  Widget build(BuildContext context) {
    Get.put(WeeklyCalendarController());

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      endDrawer: CustomRightDrawer(),
      onEndDrawerChanged: (isOpened) {
        drawerController.isDrawerOpen.value = isOpened;
      },
      body: Stack(
        children: [
          // Grey background (right side)
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.52,
              color: AppColors.SecondaryColor,
            ),
          ),

          // Main Content
          Column(
            children: [
              CustomTopBar(scaffoldKey: _scaffoldKey), // no Positioned

              // Flexible Expanded Area
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    color: AppColors.SecondaryColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        const WeeklyCalendarWidget(),

                        TaskListWidget(),

                        // Rewards section
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Rewards',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Get.to(() => RewardStoreScreen());
                              },
                              child: Text(
                                'View all',
                                style: TextStyle(
                                  color: AppColors.PrimaryColor,
                                  fontSize: 14,
                                  decoration: TextDecoration.underline,
                                  decorationColor: AppColors.PrimaryColor,
                                  decorationThickness: 1,
                                ),
                              ),
                            ),
                          ],
                        ),

                        const RewardsSection(),

                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

          // Blur background if Drawer Opened
          Obx(() {
            return drawerController.isDrawerOpen.value
                ? Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Container(
                  color: Colors.black.withOpacity(0.2),
                ),
              ),
            )
                : const SizedBox.shrink();
          }),
        ],
      ),
    );
  }
}
