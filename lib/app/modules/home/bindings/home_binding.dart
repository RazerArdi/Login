import 'package:get/get.dart';
import '../controllers/HomeController.dart';

// Binding untuk menghubungkan HomeController dengan dependency injection
class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController()); // Menyediakan HomeController secara lazy loading
  }
}
