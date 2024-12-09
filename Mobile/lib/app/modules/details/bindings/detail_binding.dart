import 'package:get/get.dart';
import 'package:project_mobile/app/modules/details/controllers/detail_controller.dart';

class DetailsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailsController>(() => DetailsController());
  }
}