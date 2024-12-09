import 'package:get/get.dart';
import 'package:project_mobile/app/modules/drink/controllers/drink_controller.dart';

class DrinkBindings extends Bindings {
  @override
  void dependencies() {
    // Menginisialisasi FoodController secara lazy (hanya saat diperlukan)
    Get.lazyPut<DrinkController>(() => DrinkController());
  }
}