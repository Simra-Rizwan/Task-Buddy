import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../Models/RewardItemModel.dart';
import '../constants/colors.dart';
import '../screens/RewardStoreScreen.dart';

class RedeemBottomSheet {
  static void show(BuildContext context, RewardItemModel reward) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black.withOpacity(0.4), // for blur
      builder: (context) {
        return Stack(
          children: [
            // Blur background
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Container(
                  color: Colors.black.withOpacity(0.2),
                ),
              ),
            ),

            // Bottom sheet
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 500, // Increased height to fit new content
                width: double.infinity,
                child: Stack(
                  children: [
                    // Background image
                    Positioned.fill(
                      child: Image.asset(
                        'assets/images/bottom_sheet_shape.png', // Your background
                        fit: BoxFit.cover,
                      ),
                    ),

                    // Content
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(height: 12),
                          const Text(
                            'Redeem reward',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Image.asset(
                            reward.image,
                            height: 100,
                            fit: BoxFit.contain,
                          ),
                          const SizedBox(height: 20),
                          Text(
                            reward.name,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            "This awesome little ${reward.name.toLowerCase()} is just what you need for some fun at home.",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            'Epic dollars required: ${reward.price}',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 20),

                          // Request Redemption button
                          ElevatedButton(
                            onPressed: () {
                              // Your redeem logic
                              Get.back(); // Close the bottom sheet first
                              Future.delayed(const Duration(milliseconds: 300), () {
                                Get.to(() => RewardStoreScreen());
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.amber,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                            ),
                            child: const Text(
                              'Request redemption',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),

                          const SizedBox(height: 16),

                          // Need Help Text
                          Column(
                            children: [
                              Row(
                                children: [
                          const Text(
                            'Need help?Contact us at ',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                            ),
                          ),
                      const Text(
                       'support@taskbuddy.com',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.PrimaryColor,
                        ),
                      )
                                ],
                                 /*child:  const Text(
                                    'Need help?Contact us at support@taskbuddy.com',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: AppColors.PrimaryColor,
                                    ),
                                  ),
                                  const Text(data)*/
                              ),

                              const SizedBox(height: 10),

                              // Social Media Icons Row
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      // Navigate to Facebook
                                    },
                                    icon: Image.asset(
                                      'assets/images/facebook.png',
                                      height: 24,
                                      width: 24,
                                      color: AppColors.PrimaryColor,
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  IconButton(
                                    onPressed: () {
                                      // Navigate to Twitter
                                    },
                                    icon: Image.asset(
                                      'assets/images/twitter.png',
                                      height: 24,
                                      width: 24,
                                      color: AppColors.PrimaryColor,
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  IconButton(
                                    onPressed: () {
                                      // Navigate to Instagram
                                    },
                                    icon: Image.asset(
                                      'assets/images/instagram.png',
                                      height: 24,
                                      width: 24,
                                      color: AppColors.PrimaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
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
}
