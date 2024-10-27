import 'package:codelabmodul3/app/modules/home/views/home_view.dart';
import 'package:codelabmodul3/app/modules/home/bindings/home_binding.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

// Definisi rute aplikasi
class AppRoutes {
  static const INITIAL = Routes.HOME; // Rute awal aplikasi

  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => HomeView(),
      binding: HomeBinding(), // Binding HomeController
    ),
  ];
}

// Definisi konstanta untuk rute
class Routes {
  static const WELCOME = '/welcome'; // Rute untuk halaman selamat datang
  static const LOGIN = '/login'; // Rute untuk halaman login
  static const REGISTER = '/register'; // Rute untuk halaman pendaftaran
  static const HOME = '/home'; // Rute untuk halaman utama
}