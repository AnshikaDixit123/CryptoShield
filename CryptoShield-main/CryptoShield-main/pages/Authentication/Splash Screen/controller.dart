import 'package:cryptog/pages/Authentication/Auth_Repo/auth_repo.dart';
import 'package:cryptog/pages/Authentication/Welcome%20Screen/welcome_screen.dart';
import 'package:cryptog/pages/Core%20App/Dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  static SplashScreenController get find => Get.find();

  RxBool animate = false.obs;

  Future<Widget> startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 75));
    animate.value = true;
    await Future.delayed(const Duration(milliseconds: 3500));
    // Check if the user is logged in
    final isLoggedIn = await Get.find<AuthenticationRepository>().isLoggedIn();
    return isLoggedIn ? const Dashboard() : const WelcomeScreen();
  }
}
