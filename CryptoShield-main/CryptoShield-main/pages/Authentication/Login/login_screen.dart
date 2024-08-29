

import 'package:cryptog/constants/sizes.dart';
import 'package:cryptog/pages/Authentication/Login/login_widgets/footer_widget.dart';
import 'package:cryptog/pages/Authentication/Login/login_widgets/header_widget.dart';
import 'package:cryptog/pages/Authentication/Login/login_widgets/login_form.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

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
                LoginHeaderWidget(),
                LoginForm(),
                LoginFooterWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}