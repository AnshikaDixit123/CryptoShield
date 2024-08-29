
import 'package:cryptog/constants/sizes.dart';
import 'package:cryptog/pages/Authentication/Phone%20Number%20Login/p_footer.dart';
import 'package:cryptog/pages/Authentication/Phone%20Number%20Login/p_header.dart';
import 'package:cryptog/pages/Authentication/Phone%20Number%20Login/p_otpform.dart';
import 'package:flutter/material.dart';

class PhoneScreen extends StatelessWidget {
  const PhoneScreen({Key? key}) : super(key: key);

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
                PhoneHeaderWidget(),
                OtpForm(),
                PhoneFooterWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}