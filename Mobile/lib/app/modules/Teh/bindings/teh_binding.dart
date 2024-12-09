import 'package:get/get.dart';
import 'package:project_mobile/app/modules/Teh/controllers/teh_controller.dart';


class TehBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TehController>(() => TehController());
  }
}
