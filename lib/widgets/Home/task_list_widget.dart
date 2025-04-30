import 'package:flutter/material.dart';
import 'package:fluttertest/widgets/Home/task_item_widget.dart';
import 'package:get/get.dart';
import '../../constants/colors.dart';
import '../../controller/task_controller.dart';
import '../../screens/MyTasksScreen.dart';
import '../../screens/RewardStoreScreen.dart';

class TaskListWidget extends StatelessWidget {
  TaskListWidget({super.key});
  final TaskController taskController = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title Row
          Row(
            children: [
              const Text(
                "Tasks",
                style: TextStyle(fontFamily: 'Baloo2',fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  // Handle "View all" action
                  Get.to( () => MyTasksScreen());
                },
                child: const Text(
                  'View all',
                  style: TextStyle(fontFamily: 'Baloo2',
                      color: AppColors.PrimaryColor,
                      fontSize: 14,
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.PrimaryColor,
                      decorationThickness: 1
                  ),
                ),
              ),

            ],
          ),

          const SizedBox(height: 1),

          SizedBox(
            child: Padding(
              padding: EdgeInsets.only(top: 0),

              child: ListView.builder(
                padding: EdgeInsets.only(top: 5),
                shrinkWrap: true,
                primary: false,
                itemCount: taskController.tasks.length,
                itemBuilder: (context, index) {
                  final task = taskController.tasks[index];
                  return TaskItemWidget(
                    title: task.title,
                    time: task.time,
                    iconPath: task.iconPath,
                    reward: task.reward,

                  );
                },
              ),
            ),
          )


        ],
      ),
    );
  }
}
