import 'package:get/get.dart';
import '../controllers/register_controller.dart';

// Binding untuk menghubungkan RegisterController dengan dependency injection
class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterController>(() => RegisterController()); // Menyediakan RegisterController secara lazy loading
  }
}
