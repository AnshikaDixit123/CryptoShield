
import 'package:cryptog/constants/sizes.dart';
import 'package:cryptog/constants/text_strings.dart';
import 'package:cryptog/pages/Authentication/Phone%20Number%20Login/otp_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var otp;
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          child: const Icon(Icons.arrow_back_ios),
          onTap: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDefaultSize),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                tOtpTitle,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 80.0)
                // style: GoogleFonts.montserrat(fontWeight: FontWeight.bold, fontSize: 80.0),
              ),
              Text(tOtpSubTitle.toUpperCase(), style: Theme.of(context).textTheme.bodyMedium),
              const SizedBox(height: 40.0),
              const Text(tOtpMessage, textAlign: TextAlign.center),
              const SizedBox(height: 20.0),
              OtpTextField(
                  mainAxisAlignment: MainAxisAlignment.center,
                  numberOfFields: 6,
                  fillColor: Colors.black.withOpacity(0.1),
                  filled: true,
                  onSubmit: (code) {
                    otp=code;
                    OTPController.instance.verifyOTP(otp);
                  }),
              const SizedBox(height: 20.0),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed: () {
                  OTPController.instance.verifyOTP(otp);
                }, child: const Text(tNext)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}