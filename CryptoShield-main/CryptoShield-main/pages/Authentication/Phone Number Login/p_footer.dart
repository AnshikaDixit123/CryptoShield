
import 'package:cryptog/constants/image_strings.dart';
import 'package:cryptog/constants/sizes.dart';
import 'package:cryptog/constants/text_strings.dart';
import 'package:cryptog/pages/Authentication/Login/login_widgets/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PhoneFooterWidget extends StatelessWidget {
  const PhoneFooterWidget({
    super.key,
  });

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
      ],
    );
  }
}