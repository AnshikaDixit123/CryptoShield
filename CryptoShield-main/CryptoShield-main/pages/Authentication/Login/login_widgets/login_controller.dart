import 'package:cryptog/pages/Authentication/Auth_Repo/auth_repo.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  /// TextField Controllers to get data from TextFields
  final email = TextEditingController();
  final password = TextEditingController();

  /// TextField Validation

  //Call this Function from Design & it will do the rest
  Future<void> login() async {
    String? error = await AuthenticationRepository.instance.loginWithEmailAndPassword(email.text.trim(), password.text.trim());
    if(error != null) {
      Get.showSnackbar(GetSnackBar(message: error.toString(),duration: const Duration(seconds: 5)));
    }
  }

  Future<void> googleSignIn() async {
    try{
      await AuthenticationRepository.instance.signInWithGoogle();
    }catch(e){
      Get.showSnackbar(GetSnackBar(message: e.toString(),duration: const Duration(seconds: 5),));
    }
  }
}