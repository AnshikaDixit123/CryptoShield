
import 'package:cryptog/constants/sizes.dart';
import 'package:cryptog/pages/Authentication/Login/forgotpassword/fp_form.dart';
import 'package:cryptog/pages/Authentication/Login/forgotpassword/fp_header.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Get the size in LoginHeaderWidget()
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FPHeaderWidget(),
                FPFormWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SignUpForm {
  const SignUpForm();
}