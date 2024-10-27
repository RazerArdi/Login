import 'package:get/get.dart';
import '../controllers/auth_controller.dart';

// Binding untuk menghubungkan AuthController dengan dependency injection
class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController()); // Menyediakan AuthController sebagai dependency
  }
}
