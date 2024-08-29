
import 'package:cryptog/constants/colors.dart';
import 'package:cryptog/constants/image_strings.dart';
import 'package:cryptog/constants/sizes.dart';
import 'package:cryptog/constants/text_strings.dart';
import 'package:cryptog/pages/Authentication/Login/login_widgets/login_controller.dart';
import 'package:cryptog/pages/Authentication/Login/phone_login.dart';
import 'package:cryptog/pages/Authentication/Signup/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginFooterWidget extends StatelessWidget {
  const LoginFooterWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text("OR"),
        const SizedBox(height: tFormHeight - 10),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            icon: const Image(image: AssetImage(tGoogleLogoImage), width: 20.0),
            onPressed: () =>controller.googleSignIn(),
            label: const Text(tSignInWithGoogle),
          ),
        ),
        const SizedBox(height: tFormHeight - 10),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            icon: const Icon(Icons.phone),
            onPressed: () => Get.to( () => const PhoneScreen()),
            label: const Text(tLoginWithPhone),
          ),
        ),
        const SizedBox(height: tFormHeight - 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () => Get.to( () => const SignUpScreen()),
              child: Text.rich(
                TextSpan(
                    text: tDontHaveAnAccount,
                    style: Theme.of(context).textTheme.bodySmall,
                    children: const [
                      TextSpan(text: tSignUp, style: TextStyle(
                        color: tPrimaryColor,
                        // decoration:TextDecoration.underline,
                        ),),
                    ]),
              ),
            ),
          ],
        ),
      ],
    );
  }
}