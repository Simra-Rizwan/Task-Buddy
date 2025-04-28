import 'package:flutter/material.dart';
import 'package:fluttertest/Details/edit_profile_screen.dart';
import 'package:fluttertest/controller/user_details_controller.dart';
import 'package:get/get.dart';
import '../constants/colors.dart';

class DetailsScreen extends StatelessWidget {
  final controller = Get.put(UserDetailsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          backgroundColor: AppColors.secondary,
          elevation: 0,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.only(top: 18.0),
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
        padding: EdgeInsets.all(16.0),
        child: Obx(
              () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 07),
              Container(
                width: 350,
                height: 81,
                padding: const EdgeInsets.all(07),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),   // Curved left top
                    bottomLeft: Radius.circular(40), // Curved left bottom
                    topRight: Radius.circular(20),   // More rounded right top
                    bottomRight: Radius.circular(20), // More rounded right bottom
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('assets/images/user_image.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),
                        Text(
                          controller.name.value,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Baloo2",
                            color: AppColors.black,
                          ),
                        ),
                        SizedBox(height: 07,),
                        Text(
                          controller.email.value,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Baloo2",
                            color: AppColors.black,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    SizedBox(width: 10),
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
                        child: Text(
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
              ),
              SizedBox(height: 30),
              _buildRichText("Name: ", controller.fullName.value),
              _buildDivider(),
              SizedBox(height: 10),
              _buildRichText("Relation with parent: ", controller.relation.value),
              _buildDivider(),
              SizedBox(height: 10),
              _buildRichText("Age: ", "${controller.age.value} years old"),
              _buildDivider(),
              SizedBox(height: 10),
              _buildRichText("Gender: ", controller.gender.value),
              _buildDivider(),
              SizedBox(height: 10),
              _buildRichText("Date of birth: ", controller.dob.value),
              _buildDivider(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRichText(String title, String value) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              fontFamily: "Baloo2",
              color: AppColors.black,
            ),
          ),
          TextSpan(
            text: value,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              fontFamily: "Baloo2",
              color: AppColors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(
      color: AppColors.orange,
      thickness: 1,
      indent: 2,
      endIndent: 2,
    );
  }
}
