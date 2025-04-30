import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_buddy/constant/colors/AppColors.dart';

class MyTasksTopBar extends StatelessWidget {
  const MyTasksTopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, left: 16, right: 16, bottom: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /// Back Arrow in Square Container
          GestureDetector(
            onTap: () => Get.back(),
            child: Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Center(
                child: Image.asset('assets/images/arrow-left.png',width: 26,height: 26),

              ),
            ),
          ),

          const Text(
            "My tasks",
            style: TextStyle(
              fontFamily: 'Baloo2',
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),

          /// Coin Display
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.SecondaryColor,
              border: Border.all(color: AppColors.PrimaryColor,width: 1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Image.asset('assets/images/coin.png', width: 16),
                const SizedBox(width: 4),
                const Text(
                  "400",
                  style: TextStyle(  fontFamily: 'Baloo2',fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
