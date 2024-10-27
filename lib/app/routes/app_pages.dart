import 'package:codelabmodul3/app/modules/home/bindings/auth_binding.dart';
import 'package:codelabmodul3/app/modules/home/bindings/home_binding.dart';
import 'package:codelabmodul3/app/modules/home/bindings/register_binding.dart';
import 'package:codelabmodul3/app/modules/home/views/home_view.dart';
import 'package:codelabmodul3/app/modules/home/views/login_view.dart';
import 'package:codelabmodul3/app/modules/home/views/register_page.dart';
import 'package:codelabmodul3/app/modules/home/views/welcome_page.dart';
import 'package:get/get.dart';
import 'app_routes.dart';

// Definisi semua halaman dan binding-nya
class AppPages {
  static final routes = [
    GetPage(
      name: Routes.WELCOME,
      page: () => const WelcomePage(), // Halaman selamat datang
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginView(),
      binding: AuthBinding(), // Binding AuthController
    ),
    GetPage(
      name: Routes.REGISTER,
      page: () => RegisterPage(),
      binding: RegisterBinding(), // Binding RegisterController
    ),
    GetPage(
      name: Routes.HOME,
      page: () => HomeView(),
      binding: HomeBinding(), // Binding HomeController
    ),
  ];
}
