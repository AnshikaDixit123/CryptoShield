import 'package:cryptog/firebase_options.dart';
import 'package:cryptog/pages/Authentication/Auth_Repo/auth_repo.dart';
import 'package:cryptog/pages/Authentication/Splash%20Screen/splash_screen.dart';
import 'package:cryptog/theme/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Initialize the AuthenticationRepository before using Get.find
  Get.put<AuthenticationRepository>(AuthenticationRepository());

  // Use await to get the login state asynchronously
  final isLoggedIn = await Get.find<AuthenticationRepository>().isLoggedIn();

  runApp(App(isLoggedIn: isLoggedIn));
}

class App extends StatelessWidget {
  final bool isLoggedIn;

  const App({Key? key, required this.isLoggedIn}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: TAppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      defaultTransition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
      home: SplashScreen(),
    );
  }
}
