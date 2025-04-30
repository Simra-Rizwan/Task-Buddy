import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class TaskItemWidget extends StatelessWidget {
  final String title;
  final String time;
  final String iconPath;
  final int reward;
  final bool isChecked;
  final Function(bool?)? onChanged;

  const TaskItemWidget({
    super.key,
    required this.title,
    required this.time,
    required this.iconPath,
    required this.reward,
    this.isChecked = false,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Main Task Card
        Container(
          margin: const EdgeInsets.only(left: 15, bottom: 16), // Leave space for image overflow
          padding: const EdgeInsets.only(left: 40, right: 16, top: 10, bottom: 15),
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
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              const SizedBox(width: 16), // Space for avatar
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        style: const TextStyle(
                          fontFamily: 'Baloo2',
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        )),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(Icons.access_time_rounded,
                            size: 14, color: isChecked ? Colors.black : Colors.red),
                        const SizedBox(width: 4),
                        Text(
                          time,
                          style: TextStyle(
                            fontSize: 12,
                            color: isChecked ? Colors.black : Colors.red,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                decoration: BoxDecoration(
                  color: AppColors.SecondaryColor,
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Image.asset("assets/images/dollar_icon.png", height: 16),
                    const SizedBox(width: 4),
                    Text(
                      reward.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 13),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        // Avatar Circle + Checkbox (outside main container)
        Positioned(
          top: -20,
          bottom: -2,
          left: 0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.PrimaryColor,
                        width: 1,
                      ),
                      color: Colors.white,
                    ),
                    child: Center(
                      child: Image.asset('assets/images/task_item.png',
                        width: 30,
                        height: 30,
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
                        value: isChecked,
                        onChanged: onChanged,
                        side: const BorderSide(
                          color: Colors.black,
                          width: 1,
                        ),
                        fillColor: MaterialStateProperty.all(Colors.white),
                        checkColor: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
