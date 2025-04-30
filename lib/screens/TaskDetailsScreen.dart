import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_buddy/constant/colors/AppColors.dart';
import 'package:task_buddy/screens/MyTasksScreen.dart';
import '../Models/MyTasksModel.dart';
import '../controller/add_award_controller.dart';
import '../widgets/Home/UploadPhotoButton.dart';

class TaskDetailsScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final MyTasksModel task = Get.arguments;

    // Register controller if not already registered
    final AddAwardController awardController = Get.put(AddAwardController());

    return Scaffold(

      backgroundColor: AppColors.SecondaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [


            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 24), // <-- Top margin added here
                  child: GestureDetector(
                    onTap: () => Get.back(),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Image.asset(
                        'assets/images/arrow-left.png',
                        width: 24,
                        height: 24,
                      ),
                    ),
                  ),
                ),
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(top: 24),
                    child: Center(
                      child: Text(
                        'Task Details',
                        style: TextStyle(
                          fontFamily: 'Baloo2',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 40),
              ],
            ),


            const SizedBox(height: 30),


            _buildDetailRow("Task name", task.title),
            const SizedBox(height: 16),
            _buildDetailRow("Deadline", task.time, icon: Icons.access_time),
            const SizedBox(height: 16),
            _buildRewardRow(task.coins),
            const SizedBox(height: 16),





            const Text(
              "Upload photo",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            UploadPhotoContainer(),

SizedBox(height: 40),

            // Complete button
            Center(
              child: SizedBox(
                width: 140,

                child: ElevatedButton(
                  onPressed: () {

                    // Handle completion
                    Get.to( () => MyTasksScreen());
                  },

                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    "Complete",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value, {IconData? icon}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
        Row(
          children: [
            if (icon != null) ...[
              Icon(icon, size: 18, color: Colors.grey),
              const SizedBox(width: 4),
            ],
            Text(value,
                style: const TextStyle(fontSize: 16, color: Colors.black)),
          ],
        ),
      ],
    );
  }

  Widget _buildRewardRow(int coins) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text("Reward",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
          decoration: BoxDecoration(
            color: const Color(0xFFF4F4F4),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.black),
          ),
          child: Row(
            children: [
              Image.asset("assets/images/coin.png", height: 18),
              const SizedBox(width: 6),
              Text(coins.toString(),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 14)),
            ],
          ),
        ),
      ],
    );
  }
}
