
import 'package:cryptog/constants/colors.dart';
import 'package:cryptog/constants/text_strings.dart';
import 'package:cryptog/pages/Authentication/Login/phone_login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SignUpFooterWidget extends StatelessWidget {
  const SignUpFooterWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
                  onPressed: () => Get.to( () => const PhoneScreen()),
                  child: Text.rich(
                    TextSpan(
                        text: tAlreadyHaveAnAccount,
                        style: Theme.of(context).textTheme.bodySmall,
                        children: const [
                          TextSpan(text: tLogin, style: TextStyle(
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