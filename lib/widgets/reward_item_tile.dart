import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:fluttertest/widgets/redeem_award_bottom_sheet.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../Models/RewardItemModel.dart';

class RewardItemTile extends StatelessWidget {
  final RewardItemModel reward;
  final bool isRedeemable;
  final bool isNotRedeemable;

  const RewardItemTile({
    super.key,
    required this.reward,
    required this.isRedeemable,
    required this.isNotRedeemable,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (isRedeemable) ...[
            SizedBox(
              height: 40,
              child: Image.asset(
                reward.image,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              reward.name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
                fontFamily: 'Baloo2',
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 2),
            Text(
              '${reward.price} Epic dollars',
              style: const TextStyle(fontSize: 11, color: Colors.grey),
            ),
            const SizedBox(height: 6),


            Stack(
              alignment: Alignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: LinearProgressIndicator(
                    minHeight: 10, // Increased height to fit text
                    value: reward.earned / reward.price,
                    backgroundColor: Colors.grey[300],
                    valueColor: const AlwaysStoppedAnimation<Color>(Colors.amber),
                  ),
                ),
                Text(
                  '${reward.earned} earned',
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),


            const SizedBox(height: 6),
            ElevatedButton(
              onPressed: () {
                showRedeemSuccessDialog(context);

                //want to open custom dialog box here on pressed of redeem button
              },


              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
                minimumSize: const Size(0, 24),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              child: const Text(
                'Redeem',
                style: TextStyle(color: Colors.black, fontSize: 11),
              ),
            ),
          ],

          if (isNotRedeemable) ...[

GestureDetector(
  onTap: (){
    RedeemBottomSheet.show(context,reward);
  },
  child: Column(
    children: [
      SizedBox(
        height: 50,
        child: Image.asset(
          reward.image,
          fit: BoxFit.contain,
        ),
      )

    ],
  ),
),


            const SizedBox(height: 6),
            Text(
              reward.name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
                fontFamily: 'Baloo2',
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 2),
            Text(
              '${reward.price} Epic dollars',
              style: const TextStyle(fontSize: 11, color: Colors.black),
            ),
            const SizedBox(height: 4),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: LinearProgressIndicator(
                      minHeight: 5, // thinner progress bar
                      value: reward.earned / reward.price,
                      backgroundColor: Colors.grey[300],
                      valueColor: const AlwaysStoppedAnimation<Color>(Colors.amber),
                    ),
                  ),
                ),
                const SizedBox(width: 6),
                Text(
                  '${reward.earned} earned',
                  style: const TextStyle(fontSize: 10, color: Colors.black),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}


// custom dialog box

void showRedeemSuccessDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false, // force user to press submit
    builder: (BuildContext context) {
      return Stack(
        children: [
          // Blur background
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(color: Colors.black.withOpacity(0.3)),
            ),
          ),

          // Dialog content
          Center(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Request sent",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Your redemption request has been sent to parent. "
                        "Once they approve your request you will receive gift.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {
                      Get.back(); // close the dialog
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      "Submit",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    },
  );
}
