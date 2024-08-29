
import 'package:cryptog/constants/colors.dart';
import 'package:cryptog/constants/sizes.dart';
import 'package:cryptog/constants/text_strings.dart';
import 'package:cryptog/pages/Authentication/Phone%20Number%20Login/otp_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class OtpForm extends StatelessWidget {
  const OtpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(OTPController());
    final _formKey = GlobalKey<FormState>();
    var otp;

    return Form(
      key: _formKey,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: tFormHeight - 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [


            TextFormField(
              controller: controller.phoneNo,
              decoration: const InputDecoration(
                iconColor: tPrimaryColor,
                  prefixIcon: Icon(Icons.phone),
                  labelText: tPhoneNo,
                  hintText: tPhoneNo,
                  border: OutlineInputBorder()),
            ),
            const SizedBox(height: tFormHeight - 25),


            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                  onPressed: () {
                    if(_formKey.currentState!.validate()){
                        OTPController.instance.phoneAuthentication(controller.phoneNo.text.trim());
                    }
                  }, 
                  child: Text.rich(
                    TextSpan(
                        text: tGenerate,
                        style: Theme.of(context).textTheme.bodySmall,
                        ),
              ),
             ),
            ),
            const SizedBox(height: tFormHeight - 25),
            OtpTextField(
              numberOfFields: 6,
              fillColor: Colors.black.withOpacity(0.1),
              filled: true,
              onSubmit: (code) {
                otp = code;
                OTPController.instance.verifyOTP(otp);
              },
            ),
            const SizedBox(height: tFormHeight), 
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  OTPController.instance.verifyOTP(otp);
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