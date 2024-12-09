import 'package:get/get.dart';
import 'package:project_mobile/app/modules/snack/controllers/snack_controller.dart';

class SnackBindings extends Bindings {
  @override
  void dependencies() {
    // Menginisialisasi FoodController secara lazy (hanya saat diperlukan)
    Get.lazyPut<SnackController>(() => SnackController());
  }
}