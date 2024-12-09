import 'package:get/get.dart';
import 'package:project_mobile/app/modules/ProfilUtama/controllers/utama_controller.dart';

class ProfileBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UtamaController>(() => UtamaController());
  }
}