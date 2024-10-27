import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/register_controller.dart';

// Halaman untuk pendaftaran pengguna
class RegisterPage extends StatelessWidget {
  final RegisterController registerController = Get.find<RegisterController>(); // Mengambil RegisterController

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'), // Judul halaman
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(), // Input untuk email
              ),
              onChanged: (value) => registerController.email.value = value, // Mengatur email yang diobservasi
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(), // Input untuk password
              ),
              obscureText: true,
              onChanged: (value) => registerController.password.value = value, // Mengatur password yang diobservasi
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                registerController.registerUser(); // Menangani pendaftaran
              },
              child: Text('Register'), // Tombol untuk pendaftaran
            ),
          ],
        ),
      ),
    );
  }
}
