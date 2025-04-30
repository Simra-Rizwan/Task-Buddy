import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/colors.dart';
import '../controller/reward_store_controller.dart';
import '../widgets/reward_item_tile.dart';

class RewardStoreScreen extends StatelessWidget {
  RewardStoreScreen({super.key});

  final RewardStoreController controller = Get.put(RewardStoreController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.SecondaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            // Top Row with Back Arrow and Title
            Row(
              children: [

                GestureDetector(
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
                Expanded(
                  child: Center(
                    child: Text(
                      'Reward Store',
                      style: const TextStyle(
                        fontFamily: 'Baloo2',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 32), // spacing for symmetry
              ],
            ),

            const SizedBox(height: 20),

            // Grid Section


            Expanded(
              child: Obx(
                    () => GridView.builder(
                  padding: const EdgeInsets.only(top: 4),
                  itemCount: controller.rewards.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 12,
                    childAspectRatio: 0.65, // slightly adjusted for new design
                  ),
                  itemBuilder: (context, index) {
                    final reward = controller.rewards[index];

                    bool isRedeemable = reward.earned >= reward.price;
                    bool isNotRedeemable = reward.earned < reward.price;

                    return RewardItemTile(
                      reward: reward,
                      isRedeemable: isRedeemable,
                      isNotRedeemable: isNotRedeemable,
                    );
                  },
                ),
              ),
            ),




          ],
        ),
      ),
    );
  }
}
