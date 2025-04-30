import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_buddy/constant/colors/AppColors.dart';
import '../../Models/MyTasksModel.dart';
import '../../controller/my_tasks_controller.dart';
import '../../screens/TaskDetailsScreen.dart';

class MyTaskCard extends StatelessWidget {
  final MyTasksModel task;
  final int index;

  MyTaskCard({required this.task, required this.index});

  final controller = Get.find<MyTasksController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => TaskDetailsScreen(), arguments: task);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Main Card
          Container(
            margin: const EdgeInsets.fromLTRB(32, 8, 16, 20), // Space for avatar
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(52),
                bottomLeft: Radius.circular(52),
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(width: 40), // Spacer for avatar
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          task.title,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            fontFamily: 'Baloo2',
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          task.time,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: task.title == "Clean your room"
                                ? Colors.grey
                                : Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 60,
                  height: 25,
                  margin: const EdgeInsets.only(left: 1, bottom: 8, right: 8, top: 8),
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF4F4F4),
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Image.asset("assets/images/dollar_icon.png", height: 16),
                      const SizedBox(width: 4),
                      Text(
                        task.coins.toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Positioned Avatar + Checkbox (outside left)
          Positioned(
            top: 12,
            left: 15,
            bottom: 5,
            child: Column(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        border: Border.all(
                          color: AppColors.PrimaryColor,
                          width: 1,
                        ),
                      ),
                      child: Center(
                        child: Image.asset(
                          'assets/images/task_item.png',
                          width: 30,
                          height: 30,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: -8,
                      left: 20,
                      child: Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 2,
                              offset: const Offset(0, 1),
                            ),
                          ],
                        ),
                        child: Checkbox(
                          value: task.isCompleted,
                          onChanged: (_) => controller.toggleTaskCompletion(index),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          activeColor: Colors.amber,
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          side: const BorderSide(width: 1, color: Colors.grey),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
