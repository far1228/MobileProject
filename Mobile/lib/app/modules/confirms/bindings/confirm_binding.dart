import 'package:get/get.dart';
import 'package:project_mobile/app/modules/confirms/controllers/confirm_controller.dart';

class ConfirmBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ConfirmController>(() => ConfirmController());
  }
}