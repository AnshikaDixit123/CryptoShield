import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cryptog/pages/Core%20App/models/encryption.dart';
import 'package:cryptog/pages/Core%20App/models/user_models.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PasswordManager extends GetxController {
  static PasswordManager get instance => Get.find();
  String? userId;

  PasswordManager() {
    _initializeUserId();
  }

  Future<void> _initializeUserId() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      userId = user.uid;
    } else {
      // Handle the case where no user is signed in
    }
  }

  final _db = FirebaseFirestore.instance;

  Future<void> createUser(UserModel user) async {
    try {
      // Encrypt user data
      final encryptedUserData = EncryptionService.encryptdata(user.toJson().toString());

      await _db
        .collection("Users")
        .doc(userId) // Assuming userId is a field in UserModel
        .set({
          "encryptedData": encryptedUserData.base64, // Store encrypted data in Firestore
        });

      Get.snackbar(
        "Success",
        "Your account has been created.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green.withOpacity(0.1),
        colorText: Colors.green,
      );
    } catch (error) {
      Get.snackbar(
        "Error",
        "Something went wrong. Try again",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.1),
        colorText: Colors.red,
      );
    }
  }



  CollectionReference<Map<String, dynamic>> getPasswordCollection() {
    return _db.collection('Users').doc(userId).collection('Findings'); // Access subcollection
  }

  Future<void> addPassword(String website, String username, String password) async {
    if (userId != null) {
      await getPasswordCollection().add({
        'website': website,
        'username': username,
        'password': password,
        
      });
    } else {
      // Handle the case where userId is null (shouldn't happen here)
    }
  }


  Stream<QuerySnapshot<Map<String, dynamic>>> getPasswords() {
    return getPasswordCollection().snapshots(); // Listen to subcollection changes
  }

 Future<void> updatePassword(String documentId,String website, String username, String password) async {
    if (userId != null) {
      await getPasswordCollection().doc(documentId).update({
        'website': website,
        'username': username,
        'password': password,
      });
    } else {
      // Handle the case where userId is null (shouldn't happen here)
    }
  }

  Future<void> deletePassword(String documentId) async {
    if (userId != null) {
      await getPasswordCollection().doc(documentId).delete();
    } else {
      // Handle the case where userId is null (shouldn't happen here)
    }
  }
}
