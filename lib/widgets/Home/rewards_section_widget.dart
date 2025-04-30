import 'package:flutter/cupertino.dart';
import 'package:fluttertest/widgets/Home/rewards_item_widget.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';


import '../../controller/rewards_controller.dart';

class RewardsSection extends StatelessWidget {
  const RewardsSection({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(RewardsController());

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 0), // Minimal vertical padding
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GetBuilder<RewardsController>(
            builder: (controller) {
              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.8,
                ),
                itemCount: controller.rewards.length,
                itemBuilder: (context, index) {
                  final reward = controller.rewards[index];
                  return RewardItem(
                    name: reward['name']!,
                    imagePath: reward['image']!,
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
