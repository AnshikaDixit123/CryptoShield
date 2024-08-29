
import 'package:cryptog/constants/colors.dart';
import 'package:cryptog/constants/image_strings.dart';
import 'package:cryptog/constants/sizes.dart';
import 'package:cryptog/constants/text_strings.dart';
import 'package:cryptog/pages/Authentication/Splash%20Screen/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
   SplashScreen({super.key});

  final SplashController = Get.put(SplashScreenController());
  @override
  Widget build(BuildContext context) {
    SplashController.startAnimation();
    return Scaffold(
      backgroundColor: tCardBgColor,
      body: Stack(
        children: [
          Obx( () => AnimatedPositioned(
              duration: const Duration(milliseconds: 2000),
              top: 80,
              left: SplashController.animate.value ? 70 : -80,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 2000),
                opacity: SplashController.animate.value ? 1 : 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tAppName,
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    const SizedBox(height: 10,),
                    Text(
                      tAppTagLine,
                      style: Theme.of(context).textTheme.displayMedium,
                    )
                  ],
                ),
              ),
            ),
          ),
          Obx( () => AnimatedPositioned(
              duration: const Duration(milliseconds: 2400),
              bottom: SplashController.animate.value ? 150 : 0,
              left: 70,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 2000),
                opacity: SplashController.animate.value ? 0.8 : 0,
                child: const Image(image: AssetImage(tSplashImage)),
              ),
            ),
          ),
          Obx( () => AnimatedPositioned(
              duration: const Duration(milliseconds: 2400),
              bottom: SplashController.animate.value ? 60 : 0,
              right: tDefaultSize,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 2000),
                opacity: SplashController.animate.value ? 1 : 0,
                child: Container(
                  width: tSplashContainerSize,
                  height: tSplashContainerSize,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: tPrimaryColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}