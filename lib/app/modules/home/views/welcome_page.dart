import 'package:codelabmodul3/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Halaman selamat datang
class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome'), // Judul halaman
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Get.toNamed(Routes.LOGIN), // Navigasi ke halaman login
              child: const Text('Login'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => Get.toNamed(Routes.REGISTER), // Navigasi ke halaman pendaftaran
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}

