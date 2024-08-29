
import 'package:cryptog/pages/Authentication/Auth_Repo/auth_repo.dart';
import 'package:cryptog/pages/Authentication/Signup/OTP%20screen/otp_screen.dart';
import 'package:cryptog/pages/Core%20App/models/db_services.dart';
import 'package:cryptog/pages/Core%20App/models/user_models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  //TextField Controllers to get data from TextFields
  final email = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();
  final phoneNo = TextEditingController();

  final userRepo = Get.put(PasswordManager());

  //Call this Function from Design & it will do the rest
  void registerUser(String email, String password) {
    String? error = AuthenticationRepository.instance.createUserWithEmailAndPassword(email, password) as String?;
    if(error != null) {
      Get.showSnackbar(GetSnackBar(message: error.toString(),duration: const Duration(seconds: 5)));
    }
  }
  Future<void> createUser(UserModel user) async {
    await userRepo.createUser(user);
    phoneAuthentication(user.phoneNo);
    Get.to(() => const OTPScreen());
  }
  void phoneAuthentication(String phoneNo){
    AuthenticationRepository.instance.phoneAuthentication(phoneNo);
  }

}