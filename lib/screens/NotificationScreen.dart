import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../constants/colors.dart';
import '../controller/notification_controller.dart';
import '../widgets/notification_tile.dart';

class NotificationScreen extends StatelessWidget{
  NotificationScreen ({ Key? key}): super(key: key);

  final NotificationController controller = Get.put(NotificationController());



  @override
  Widget build(BuildContext context) {

    return Scaffold(
     backgroundColor: AppColors.SecondaryColor,

      body: SafeArea(child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 20),
        physics:  const BouncingScrollPhysics(),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

// app bar
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                const Text(
                  'Notification',
                  style: TextStyle(
                    fontFamily: 'Baloo2',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const Opacity(
                  opacity: 0,
                  child: Icon(Icons.arrow_back, size: 24), // Invisible dummy widget to balance
                ),
              ],
            ),
            const SizedBox(height: 20),
// List of Notifiaction
          Obx(
              () => ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.notifications.length,
                  itemBuilder:(context, index){
                    return NotificationTile(
                        notification: controller.notifications[index],
                    );
                  }
              )

          )

          ],

        ),



      )
      ),
    );
  }


}