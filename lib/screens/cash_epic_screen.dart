import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:fluttertest/controller/cash_epic_controller.dart';
import 'package:get/get.dart';
import 'achievement_screen.dart';
import '../constants/colors.dart';
import 'history_screen.dart';

class CashEpicScreen extends StatelessWidget {
  final CashEpicController controller = Get.put(CashEpicController());

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
              'Cash epic dollar',
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
              width: 36,
              height: 36,
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
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        width: 358,
                        height: 165,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/images/cash_epic_image.png',
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                        child: Center(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Total epic dollars ",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Baloo2",
                                  color: AppColors.black,
                                ),
                              ),
                              Image.asset(
                                'assets/images/dollar_image.png',
                                width: 24,
                                height: 24,
                              ),
                              SizedBox(width: 6),
                              Text(
                                "400",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Baloo2",
                                  color: AppColors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 6.0),
                    Text(
                      "Cash Out",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Baloo2",
                      ),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      readOnly: false,
                      decoration: InputDecoration(
                        hintText:
                            "100 epic dollar is equal to \$1 when cash out",
                        hintStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Baloo2",
                        ),
                        fillColor: AppColors.white,
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: AppColors.orange),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: AppColors.orange,
                            width: 2.0,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 25.0),
                    Center(
                      child: SizedBox(
                        height: 40,
                        width: 156,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.black,
                            backgroundColor: AppColors.orange,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          onPressed: () {
                            showGeneralDialog(
                              context: context,
                              barrierDismissible: false,
                              barrierLabel: "BlurredBackground",
                              barrierColor: Colors.black.withOpacity(0.3),
                              transitionDuration: Duration(milliseconds: 300),
                              pageBuilder: (
                                context,
                                animation,
                                secondaryAnimation,
                              ) {
                                return Stack(
                                  children: [
                                    BackdropFilter(
                                      filter: ImageFilter.blur(
                                        sigmaX: 5,
                                        sigmaY: 5,
                                      ),
                                      child: Container(
                                        color: Colors.black.withOpacity(0.1),
                                      ),
                                    ),
                                    Center(
                                      child: Dialog(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                        ),
                                        insetPadding: EdgeInsets.only(
                                          top: 200,
                                          left: 19,
                                          right: 19,
                                        ),
                                        child: SizedBox(
                                          width: 358,
                                          height: 237,
                                          child: Padding(
                                            padding: EdgeInsets.all(20.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Container(
                                                  padding: EdgeInsets.all(16.0),
                                                  child: Image.asset(
                                                    'assets/images/checkbox_image.png',
                                                    width: 65,
                                                    height: 65,
                                                  ),
                                                ),
                                                Text(
                                                  "Your request has been submitted!",
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w600,
                                                    fontFamily: "Baloo2",
                                                    color: AppColors.epic,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                                SizedBox(height: 14),
                                                SizedBox(
                                                  width: 156,
                                                  height: 40,
                                                  child: ElevatedButton(
                                                    style: ElevatedButton.styleFrom(
                                                      foregroundColor:
                                                          Colors.black,
                                                      backgroundColor:
                                                          AppColors.orange,
                                                      shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              8.0,
                                                            ),
                                                      ),
                                                    ),
                                                    onPressed: () {
                                                      // Get.back();
                                                      Get.back();
                                                    },
                                                    child: Text(
                                                      "Okay",
                                                      style: TextStyle(
                                                        fontSize: 16.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontFamily: "Baloo2",
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: Text(
                            "Submit",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Baloo2",
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "History",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Baloo2",
                          ),
                        ),
                        GestureDetector(
                          onTap: () => Get.to(() => HistoryScreen()),
                          child: Text(
                            "View All",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Baloo2",
                              color: AppColors.orange,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      height: 300,
                      child: Obx(
                        () => ListView.builder(
                          itemCount: controller.history.length,
                          itemBuilder: (context, index) {
                            var item = controller.history[index];
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 3.0),
                              child: Card(
                                color: AppColors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 6,
                                  ),
                                  child: Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                          8.0,
                                        ),
                                        child: Image.asset(
                                          item['image'],
                                          width: 43,
                                          height: 35.2,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                      SizedBox(width: 12),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              item['title'],
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w800,
                                                fontFamily: "Baloo2",
                                                color: AppColors.black,
                                              ),
                                            ),
                                            Text(
                                              item['date'],
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                fontFamily: 'Baloo2',
                                                color: AppColors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            "Epic dollars",
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: "Baloo2",
                                              color: AppColors.black,
                                            ),
                                          ),
                                          SizedBox(height: 4),
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 15,
                                              vertical: 0,
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                color: AppColors.black,
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Image.asset(
                                                  'assets/images/dollar_image.png',
                                                  width: 20,
                                                  height: 20,
                                                ),
                                                SizedBox(width: 7),
                                                Text(
                                                  "${item["epicDollars"]}",
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily: "Baloo2",
                                                    color: AppColors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 5,)
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
