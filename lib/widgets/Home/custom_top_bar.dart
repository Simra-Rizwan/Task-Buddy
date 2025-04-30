import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:task_buddy/constant/colors/AppColors.dart';

class CustomTopBar extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey; // Added this field to accept the scaffoldKey
  bool isMenuOpened = false; // To track if menu is opened

 CustomTopBar({super.key, required this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0, // Leaves space to show grey background
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 36),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(30),
          ),
        ),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Profile image
              const CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage('assets/images/profile.png'),
              ),

              // Coin balance
              Stack(
                clipBehavior: Clip.none, // for overflow
                children: [
                  Container(
                    width: 100,
                    height: 30,
                    padding: const EdgeInsets.only(left: 20, right: 10),
                    decoration: BoxDecoration(
                      color: AppColors.SecondaryColor,
                      border: Border.all(
                        color: AppColors.PrimaryColor,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '400',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    left: -3,
                    child: SizedBox(
                      height: 30,
                      child: Center(
                        child: Image.asset(
                          'assets/images/coin.png',
                          width: 20,
                          height: 20,
                        ),
                      ),
                    ),
                  ),



                ],
              ),


              // Menu icon
              GestureDetector(
                onTap: () {
                  scaffoldKey.currentState?.openEndDrawer();


                },
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: AppColors.SecondaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.menu,
                    size: 24,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}