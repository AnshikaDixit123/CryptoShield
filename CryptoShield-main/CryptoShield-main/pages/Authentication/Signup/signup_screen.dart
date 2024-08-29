
import 'package:cryptog/constants/sizes.dart';
import 'package:cryptog/pages/Authentication/Signup/widgets/footer.dart';
import 'package:cryptog/pages/Authentication/Signup/widgets/form.dart';
import 'package:cryptog/pages/Authentication/Signup/widgets/header.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

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
                SignUpHeaderWidget(),
                SignUpFormWidget(),
                SignUpFooterWidget(),
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