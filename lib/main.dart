import"package:flutter/material.dart";
import "package:fluttertest/screens/onboarding/splash_screen.dart";
import"package:get/get.dart";

void main(){
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home:SplashScreen()
  ));
}