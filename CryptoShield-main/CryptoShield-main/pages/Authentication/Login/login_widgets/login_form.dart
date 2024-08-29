import 'package:cryptog/constants/colors.dart';
import 'package:cryptog/constants/sizes.dart';
import 'package:cryptog/constants/text_strings.dart';
import 'package:cryptog/pages/Authentication/Auth_Repo/auth_repo.dart';
import 'package:cryptog/pages/Authentication/Login/forgotpassword/forgot_pass.dart';
import 'package:cryptog/pages/Authentication/Login/login_widgets/login_controller.dart';
import 'package:cryptog/pages/Core%20App/Dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController.instance);

    return Form(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: tFormHeight - 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: controller.email,
              decoration: const InputDecoration(
                iconColor: tPrimaryColor,
                prefixIcon: Icon(Icons.person_outline_outlined),
                labelText: tEmail,
                hintText: tEmail,
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: tFormHeight - 20),
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  Get.showSnackbar(const GetSnackBar(
                    message: 'Please enter your password',
                    duration: Duration(seconds: 5),
                  ));
                }
                return null;
              },
              controller: controller.password,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.fingerprint),
                labelText: tPassword,
                hintText: tPassword,
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: null,
                  icon: Icon(Icons.remove_red_eye_sharp), // Optional: Password visibility toggle
                ),
              ),
            ),
            const SizedBox(height: tFormHeight - 20),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () => Get.to(() => const ForgotPassword()),
                child: Text.rich(
                  TextSpan(
                    text: tForgetPassword,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  await controller.login();

                  // Check login state and navigate accordingly
                  final isLoggedIn = await Get.find<AuthenticationRepository>().isLoggedIn();
                  if (isLoggedIn) {
                    Get.offAll(() => const Dashboard()); // Redirect to welcome page
                  } else {
                    // Handle failed login or other scenarios
                  }
                },
                child: const Text(tLogin),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
