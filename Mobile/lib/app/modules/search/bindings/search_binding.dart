import 'package:get/get.dart';
import 'package:project_mobile/app/modules/search/controllers/search_controller.dart';

class SearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MySearchController>(() => MySearchController());
  }
}