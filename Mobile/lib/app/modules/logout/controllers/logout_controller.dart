import 'package:get/get.dart';

class LogoutController extends GetxController {
  void logout() {
    // Logic untuk proses logout, misalnya membersihkan session atau navigasi
    Get.back(); // Tutup dialog dan kembalikan ke layar sebelumnya
  }

  void cancel() {
    Get.back(); // Tutup dialog tanpa logout
  }
}