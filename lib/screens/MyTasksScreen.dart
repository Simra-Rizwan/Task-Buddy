import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/my_tasks_controller.dart';
import '../widgets/My Tasks/my_task_card_widget.dart';
import '../widgets/My Tasks/top_bar_widget.dart';


class MyTasksScreen extends StatelessWidget {
  final controller = Get.put(MyTasksController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Column(
        children: [
          MyTasksTopBar(),
          Expanded(
            child: Obx(() => ListView.builder(
              itemCount: controller.tasks.length,
              itemBuilder: (context, index) {
                return MyTaskCard(
                  task: controller.tasks[index],
                  index: index,
                );
              },
            )),
          ),
        ],
      ),
    );
  }
}
