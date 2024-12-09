import 'package:get/get.dart';
import '../controllers/complete_controller.dart';

class CompleteBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CompleteController>(() => CompleteController());
  }
}