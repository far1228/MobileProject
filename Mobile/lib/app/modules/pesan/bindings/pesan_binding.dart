import 'package:get/get.dart';
import 'package:project_mobile/app/modules/pesan/controllers/pesan_controller.dart';


class PesanBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PesanController>(() => PesanController());
  }
}