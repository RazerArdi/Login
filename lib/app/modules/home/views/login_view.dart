import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';

// Halaman untuk login pengguna
class LoginView extends StatelessWidget {
  final AuthController authController = Get.find<AuthController>(); // Mengambil AuthController

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')), // Judul halaman
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Email'), // Input untuk email
              onChanged: (value) => authController.email.value = value, // Mengatur email yang diobservasi
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: const InputDecoration(labelText: 'Password'), // Input untuk password
              obscureText: true,
              onChanged: (value) => authController.password.value = value, // Mengatur password yang diobservasi
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => authController.loginUser(), // Menangani login
              child: const Text('Login'),
            ),
            TextButton(
              onPressed: () => Get.toNamed('/register'), // Navigasi ke halaman pendaftaran
              child: const Text('Don’t have an account? Register'),
            ),
          ],
        ),
      ),
    );
  }
}
