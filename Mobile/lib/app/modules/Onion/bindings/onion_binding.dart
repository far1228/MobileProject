import 'package:get/get.dart';
import 'package:project_mobile/app/modules/Onion/controllers/onion_controller.dart';


class OnionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OnionController>(() => OnionController());
  }
}
