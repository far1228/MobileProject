import 'package:get/get.dart';
import 'package:project_mobile/app/modules/cancelled/controllers/cancelled_comtroller.dart';


class CancelledBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CancelledController>(() => CancelledController());
  }
}