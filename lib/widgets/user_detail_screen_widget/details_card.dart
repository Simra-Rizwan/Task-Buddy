import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/colors.dart';
import '../../controller/user_details_controller.dart';
import '../../screens/Details/edit_profile_screen.dart';

class DetailsCard extends StatelessWidget {
  final UserDetailsController controller;

  const DetailsCard({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 81,
      padding: const EdgeInsets.all(7),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          bottomLeft: Radius.circular(40),
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/images/user_image.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Text(
                controller.name.value,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Baloo2",
                  color: AppColors.black,
                ),
              ),
              const SizedBox(height: 7),
              Text(
                controller.email.value,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Baloo2",
                  color: AppColors.black,
                ),
              ),
            ],
          ),
          const Spacer(),
          const SizedBox(width: 10),
          SizedBox(
            width: 83,
            height: 27,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: AppColors.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onPressed: () {
                Get.to(() => EditProfileScreen());
              },
              child: const Text(
                "Edit",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Baloo2",
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
