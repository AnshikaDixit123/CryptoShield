
import 'package:cryptog/pages/Authentication/Auth_Repo/login_failure.dart';
import 'package:cryptog/pages/Authentication/Auth_Repo/sighup_failure.dart';
import 'package:cryptog/pages/Authentication/Welcome%20Screen/welcome_screen.dart';
import 'package:cryptog/pages/Authentication/Splash%20Screen/controller.dart';
import 'package:cryptog/pages/Authentication/Splash%20Screen/splash_screen.dart';
import 'package:cryptog/pages/Core%20App/Dashboard/dashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:local_auth/local_auth.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  //Variables
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  var verificationId = ''.obs;
  final storage = const FlutterSecureStorage();
  final _localAuth = LocalAuthentication();

  //Will be load when app launches this func will be called and set the firebaseUser state


  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  /// If we are setting initial screen from here
  /// then in the main.dart => App() add CircularProgressIndicator()
   _setInitialScreen(User? user) async {
    await SplashScreenController().startAnimation();
    final isLogged = await isLoggedIn();
    if (isLogged) {
      final isBiometricAuthenticated = await _authenticateUserWithBiometrics();
      if (isBiometricAuthenticated) {
        Get.offAll(() => const Dashboard());
      } else {
        await storage.delete(key: 'isLoggedIn');
        Get.offAll(() => const WelcomeScreen());
      }
    } else {
      await storage.delete(key: 'isLoggedIn');
      Get.offAll(() => const WelcomeScreen());
    }
  }

  Future<bool> _authenticateUserWithBiometrics() async {
    bool isAuthenticated = false;
    try {
      isAuthenticated = await _localAuth.authenticate(
        localizedReason: 'Authenticate to access the app',
        options: const AuthenticationOptions(
          biometricOnly: false,
          useErrorDialogs: true,
          stickyAuth: true
          )
      );
    } catch (e) {
      print('Error authenticating with biometrics: $e');
    }
    return isAuthenticated;
  }

   Future<bool> isLoggedIn() async {
    final loginStatus = await storage.read(key: 'isLoggedIn');
    return loginStatus == 'true';
  }

  //FUNC
  Future<void> phoneAuthentication(String phoneNo) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNo,
      verificationCompleted: (credential) async {
        await _auth.signInWithCredential(credential);
      },
      codeSent: (verificationId, resendToken) {
        this.verificationId.value = verificationId;
      },
      codeAutoRetrievalTimeout: (verificationId) {
        this.verificationId.value = verificationId;
      },
      verificationFailed: (e) {
        if (e.code == 'invalid-phone-number') {
          Get.snackbar('Error', 'The provided phone number is not valid.',duration: const Duration(seconds: 5),);
        } else {
          Get.snackbar('Error', 'Something went wrong. Try again.',duration: const Duration(seconds: 5),);
        }
      },
    );
    await storage.write(key: 'isLoggedIn', value: 'true');
  }


  //Google Auth


  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    await storage.write(key: 'isLoggedIn', value: 'true');
    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
}

  Future<bool> verifyOTP(String otp) async {
    var credential = await _auth.signInWithCredential(
        PhoneAuthProvider.credential(
            verificationId: verificationId.value, smsCode: otp));
    return credential.user != null ? true : false;
  }

  Future<String?> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      firebaseUser.value != null
          ? Get.offAll(() => const Dashboard())
          : Get.offAll(() => SplashScreen());
      await storage.write(key: 'isLoggedIn', value: 'true');
    } on FirebaseAuthException catch (e) {
      final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
      return ex.message;
    } catch (_) {
      const ex = SignUpWithEmailAndPasswordFailure();
      return ex.message;
    }
    return null;
  }

  Future<String?> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      await storage.write(key: 'isLoggedIn', value: 'true');
    } on FirebaseAuthException catch (e) {
      final ex = LogInWithEmailAndPasswordFailure.code(e.code);
      return ex.message;
    } catch (_) {
      const ex = LogInWithEmailAndPasswordFailure();
      return ex.message;
    }
    return null;
  }

  Future<void> logout() async {
    await _auth.signOut();
    await storage.delete(key: 'isLoggedIn');
  }
}
