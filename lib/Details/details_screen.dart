import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/colors.dart';
import '../../controller/user_details_controller.dart';
import '../user_detail_screen_widget/details_card.dart';
import '../user_detail_screen_widget/details_info.dart';

class DetailsScreen extends StatelessWidget {
  final controller = Get.put(UserDetailsController());

  DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      appBar:PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          backgroundColor: AppColors.secondary,
          elevation: 0,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          title: const Padding(
            padding: EdgeInsets.only(top: 18.0),
            child: Text(
              'My Details',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                fontFamily: "Baloo2",
              ),
            ),
          ),
          leading: Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 18.0),
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: AppColors.orange),
                onPressed: () => Get.back(),
                padding: EdgeInsets.zero,
              ),
            ),
          ),
          centerTitle: true,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(
              () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 7),
              DetailsCard(controller: controller),
              const SizedBox(height: 30),
              DetailsInfo(title: "Name: ", value: controller.fullName.value),
              DetailsInfo(title: "Relation with parent: ", value: controller.relation.value),
              DetailsInfo(title: "Age: ", value: "${controller.age.value} years old"),
              DetailsInfo(title: "Gender: ", value: controller.gender.value),
              DetailsInfo(title: "Date of birth: ", value: controller.dob.value),
            ],
          ),
        ),
      ),
    );
  }
}
