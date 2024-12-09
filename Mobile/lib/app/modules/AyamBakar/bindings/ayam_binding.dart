import 'package:get/get.dart';
import 'package:project_mobile/app/modules/AyamBakar/controllers/ayam_controller.dart';


class AyamBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AyamController>(() => AyamController());
  }
}
