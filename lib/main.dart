import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';
import 'app/routes/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Inisialisasi Firebase
  runApp(const MyApp());
}

// Kelas utama aplikasi
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'CRUD with Firestore', // Judul aplikasi
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.WELCOME, // Memulai dari halaman selamat datang
      getPages: AppPages.routes, // Mengambil rute dari AppPages
    );
  }
}
