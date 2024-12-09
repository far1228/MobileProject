import 'package:get/get.dart';
import 'package:project_mobile/app/modules/Rate/controllers/rate_controller.dart';


class RateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RateController());
  }
}