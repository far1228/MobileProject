import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_mobile/app/routes/app_routes.dart'; // Import Firestore

class CanorController extends GetxController {
  var selectedReason = ''.obs;

  // List of cancellation reasons
  List<String> reasons = [
    'Alamat yang digunakan salah',
    'Ingin mengubah pesanan',
    'Penjual tidak membalas chat',
    'Ingin merubah metode pembayaran',
    'Berubah pikiran'
  ];

  // Method to select a reason
  void selectReason(String reason) {
    selectedReason.value = reason;
  }

  // Method to submit cancellation
  Future<void> submitCancellation() async {
    if (selectedReason.value.isNotEmpty) {
      try {
        // Save to Firestore
        await FirebaseFirestore.instance.collection('cancellations').add({
          'reason': selectedReason.value,
          'timestamp': FieldValue.serverTimestamp(),
        });
        Get.toNamed(Routes.CANCEL_VALIDATION); // Navigate to validation page
      } catch (e) {
        // Handle error
        Get.snackbar('Error', 'Failed to submit cancellation: $e');
      }
    } else {
      Get.snackbar('Warning', 'Please select a reason for cancellation');
    }
  }
}
