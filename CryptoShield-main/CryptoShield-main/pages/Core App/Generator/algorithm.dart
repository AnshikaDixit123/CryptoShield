import 'dart:convert';
import 'dart:math';
import 'package:crypto/crypto.dart';

String generatePassword(String hint, String randomText, {int segmentLength = 2}) {
  // Input Processing & Combining
  String combinedInput = '$hint|$randomText';

  // Normalization (lowercase & remove whitespace)
  String normalizedInput = combinedInput.toLowerCase().replaceAll(RegExp(r'[^a-z0-9]'), '');

  // Cryptographic Hashing (SHA-256)
  var bytes = utf8.encode(normalizedInput);
  var hash = sha256.convert(bytes);
  String hashedOutput = hash.bytes.map((b) => b.toRadixString(16).padLeft(2, '0')).join('');

  // Symbol Generation based on Hashed Output Segments
  List<String> passwordSegments = [];
  for (int i = 0; i < hashedOutput.length; i += segmentLength) {
    String segment = hashedOutput.substring(i, min(i + segmentLength, hashedOutput.length));
    int baseValue = int.parse(segment, radix: 16);

    // Map base value to a character set (inspired by DNA bases)
    String charSet;
    if (baseValue < 4) {
      charSet = 'AT@&48'; // Adenine & Thymine (2 characters)
    } else if (baseValue < 8) {
      charSet = 'CG@1'; // Cytosine & Guanine (2 characters)
    } else if (baseValue < 12) {
      charSet = '0123456789'; // Numbers (10 characters)
    } else {
      charSet = '1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz!@#\$%^&*(){}[]'; // Symbols (special characters)
    }

    // Randomly select a character from the mapped set
    passwordSegments.add(charSet[Random().nextInt(charSet.length)]);
  }

  // Password Formation with Balanced Distribution
  String password = passwordSegments.join('');

  // Ensure at least one of each required character type:
  if (!RegExp(r'[A-Z]').hasMatch(password)) {
    password += String.fromCharCode(Random().nextInt(26) + 65); // Uppercase letter
  }
  if (!RegExp(r'[a-z]').hasMatch(password)) {
    password += String.fromCharCode(Random().nextInt(26) + 97); // Lowercase letter
  }
  if (!RegExp(r'[0-9]').hasMatch(password)) {
    password += String.fromCharCode(Random().nextInt(10) + 48); // Number
  }
  if (!RegExp(r'[!@#\$%^&*(){}\[\]]').hasMatch(password)) {
    password += String.fromCharCode(Random().nextInt(33) + 33); // Symbol
  }

  // Ensure at least one small and one capital Latin word:
  List<String> latinWords = ['lorem', 'ipsum', 'dolor', 'sit', 'amet', 'consectetur', 'adipiscing'];
  password += latinWords[Random().nextInt(latinWords.length)].toLowerCase(); // Small Latin word
  password += latinWords[Random().nextInt(latinWords.length)].toUpperCase(); // Capital Latin word

  // Finalization (ensure 15 characters)
  return password.substring(0, min(password.length, 15));
}
