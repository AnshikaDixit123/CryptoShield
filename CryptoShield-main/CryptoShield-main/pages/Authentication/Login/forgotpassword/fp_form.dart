
import 'package:cryptog/constants/colors.dart';
import 'package:cryptog/constants/sizes.dart';
import 'package:cryptog/constants/text_strings.dart';
import 'package:flutter/material.dart';

class FPFormWidget extends StatelessWidget {
  const FPFormWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: tFormHeight - 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                iconColor: tPrimaryColor,
                  prefixIcon: Icon(Icons.email_rounded),
                  labelText: tEmail,
                  hintText: tEmail,
                  border: OutlineInputBorder()),
            ),
            const SizedBox(height: 30.0,),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text(tNext),
              ),
            ),
          ],
        ),
      ),
    );
  }
}