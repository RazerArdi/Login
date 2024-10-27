import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

// Kontroler untuk menangani pendaftaran pengguna
class RegisterController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  var email = ''.obs; // Email pengguna yang diobservasi
  var password = ''.obs; // Password pengguna yang diobservasi

  // Menangani proses pendaftaran pengguna
  Future<void> registerUser() async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email.value,
        password: password.value,
      );

      Get.snackbar(
        "Success",
        "Registration successful! ${userCredential.user?.email}",
        snackPosition: SnackPosition.BOTTOM,
      );

    } on FirebaseAuthException catch (e) {
      String message = '';
      // Menangani berbagai kemungkinan kesalahan saat pendaftaran
      if (e.code == 'email-already-in-use') {
        message = 'Email already in use.';
      } else if (e.code == 'weak-password') {
        message = 'Password is too weak.';
      } else if (e.code == 'invalid-email') {
        message = 'Invalid email.';
      } else {
        message = 'An unexpected error occurred.';
      }

      Get.snackbar(
        "Error",
        message,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
