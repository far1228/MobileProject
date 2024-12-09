import 'package:get/get.dart';
import 'package:project_mobile/app/modules/Scanner/controllers/scanner_controller.dart';

class ScannerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScannerController>(() => ScannerController());
  }
}