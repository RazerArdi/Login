import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

// Kontroler untuk menangani otentikasi pengguna menggunakan FirebaseAuth
class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  var email = ''.obs; // Email pengguna yang diobservasi
  var password = ''.obs; // Password pengguna yang diobservasi

  // Menangani proses login pengguna
  Future<void> loginUser() async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email.value,
        password: password.value,
      );
      Get.offAllNamed('/home'); // Navigasi ke Home setelah login berhasil
      Get.snackbar('Success', 'Login successful'); // Menampilkan snackbar sukses
    } on FirebaseAuthException catch (e) {
      String message = '';
      // Menangani berbagai kemungkinan kesalahan saat login
      if (e.code == 'user-not-found') {
        message = 'No user found with that email.';
      } else if (e.code == 'wrong-password') {
        message = 'Incorrect password.';
      } else {
        message = 'An error occurred: ${e.message}';
      }
      Get.snackbar('Error', message); // Menampilkan snackbar error
    }
  }

  // Menangani proses pendaftaran pengguna
  Future<void> registerUser() async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email.value,
        password: password.value,
      );
      Get.snackbar('Success', 'Registration successful!'); // Menampilkan snackbar sukses
      Get.offAllNamed('/login'); // Navigasi ke halaman login setelah pendaftaran
    } on FirebaseAuthException catch (e) {
      String message = '';
      // Menangani berbagai kemungkinan kesalahan saat pendaftaran
      if (e.code == 'email-already-in-use') {
        message = 'Email already in use.';
      } else if (e.code == 'weak-password') {
        message = 'Password is too weak.';
      } else {
        message = 'An error occurred: ${e.message}';
      }
      Get.snackbar('Error', message); // Menampilkan snackbar error
    }
  }
}
