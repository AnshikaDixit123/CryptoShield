
import 'package:encrypt/encrypt.dart';

class EncryptionService {
  static const keyString = "absf8967vise6sfh7493bfke32rr38fh";
  static final key = Key.fromUtf8(keyString);

  static Encrypted encryptdata(String data) {
    final iv = IV.fromSecureRandom(16);
    final encrypter = Encrypter(AES(key));
    final encrypted = encrypter.encrypt(data, iv: iv);
    return encrypted;
  }

  static Future<String> decryptPassword(Encrypted encryptedPassword) async{
    final iv = IV.fromSecureRandom(16);
    final encrypter = Encrypter(AES(key));
    final decrypted = encrypter.decrypt(encryptedPassword, iv: iv);
    return decrypted;
  }
}