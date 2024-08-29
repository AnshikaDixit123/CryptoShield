
import 'package:cryptog/pages/Authentication/Auth_Repo/auth_repo.dart';
import 'package:cryptog/pages/Core%20App/Dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class OTPController extends GetxController {
  static OTPController get instance => Get.put(OTPController());

  final phoneNo = TextEditingController();

  void verifyOTP(String otp) async {
    var isVerified = await AuthenticationRepository.instance.verifyOTP(otp);
    isVerified ? Get.offAll( () =>const Dashboard()) : Get.showSnackbar(const GetSnackBar(title:"Wrong OTP",duration: Duration(seconds: 5),));
  }

  void phoneAuthentication(String phoneNo){
    AuthenticationRepository.instance.phoneAuthentication(phoneNo);
  }
}
