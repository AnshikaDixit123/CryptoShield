
import 'package:cryptog/constants/image_strings.dart';
import 'package:cryptog/constants/sizes.dart';
import 'package:cryptog/constants/text_strings.dart';
import 'package:cryptog/pages/Authentication/Auth_Repo/auth_repo.dart';
import 'package:cryptog/pages/Core%20App/Profile/about_us.dart';
import 'package:cryptog/pages/Core%20App/Profile/profile_menu_widget.dart';
import 'package:cryptog/pages/Core%20App/Profile/version.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
bool useBiometric = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () => Get.back(), icon:  const Icon(LineAwesomeIcons.angle_left)),
        title: Text(tProfile, style: Theme.of(context).textTheme.headlineMedium),
        
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDefaultSize),
          child: Column(
            children: [

              /// -- IMAGE
              Stack(
                children: [
                  SizedBox(
                    width: 170,
                    height: 170,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(100), child: const Image(image: AssetImage(tSplashImage))),
                  ),
                ],
               ),
         
       
              ProfileMenuWidget(title: "Version", icon: Icons.data_object_rounded, onPress: () => Get.to( () => const VersionScreen()),),


              ProfileMenuWidget(title: "About Us", icon: LineAwesomeIcons.info, onPress: () => Get.to( () => const AboutScreen()),),
            
              ProfileMenuWidget(
                  title: "Logout",
                  icon: LineAwesomeIcons.alternate_sign_out,
                  textColor: Colors.red,
                  endIcon: false,
                  onPress: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text(tLogout, style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center,), 
                                                 
                          content: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 15.0),
                            child: Text("Are you sure you want to logout?"),
                          ),
                          actions: [
                            OutlinedButton(
                              onPressed: () {
                                Navigator.of(context).pop(); // Close the dialog
                                AuthenticationRepository.instance.logout(); // Perform logout action
                              },
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.redAccent, // Consistent color scheme
                              ),
                              child: const Text("Yes"),
                            ),
                            ElevatedButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: const Text("No"),
                            ),
                          ],
                        );
                      },
                    );
                  }
                ),
            ],
          ),
        ),
      ),
    );
  }
}