import 'package:get/get.dart';
import 'package:project_mobile/app/modules/Audio/controllers/audio_controller.dart';

class AudioBinding extends Bindings {
  @override
  void dependencies() {
    // Menyediakan controller untuk digunakan di view
    Get.lazyPut<AudioController>(() => AudioController());
  }
}
