import 'package:get/get.dart';
import 'package:project_mobile/app/modules/CancelValid/controllers/cancelvalid_controller.dart';

class CancelValidBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CancelValidController>(() => CancelValidController());
  }
}