
import 'package:cryptog/constants/colors.dart';
import 'package:cryptog/constants/image_strings.dart';
import 'package:cryptog/constants/sizes.dart';
import 'package:cryptog/constants/text_strings.dart';
import 'package:cryptog/pages/Authentication/Login/phone_login.dart';
import 'package:cryptog/pages/Authentication/Signup/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});


  @override
  Widget build(BuildContext context) {


    var mediaQuery = MediaQuery.of(context);
    var height = mediaQuery.size.height;

    return Scaffold(
      backgroundColor: tCardBgColor,
      body: Container(
        padding: const EdgeInsets.all(tDefaultSize),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(image: const AssetImage(tWelcomeScreenImage), height: height * 0.6),
            Column(
              children: [
                Text(tWelcomeTitle, style: Theme.of(context).textTheme.headlineMedium,),
                Text(tWelcomeSubTitle,
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.center),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Get.to( () => const PhoneScreen()),
                    child: const Text(tLogin),
                  ),
                ),
                const SizedBox(width: 10.0),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => Get.to( () => const SignUpScreen()),
                    child: const Text(tSignUp),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}