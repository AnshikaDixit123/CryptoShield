
import 'package:cryptog/constants/image_strings.dart';
import 'package:cryptog/constants/text_strings.dart';
import 'package:flutter/material.dart';

class LoginHeaderWidget extends StatelessWidget {
  const LoginHeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Align(
      alignment: Alignment.center,
      child: Column(
        children: [
          Image(
              image: const AssetImage(tSplashImage),
              height: size.height * 0.2),
          Text(tLoginTitle, style: Theme.of(context).textTheme.headlineMedium),
          Text(tLoginSubTitle, style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }
}