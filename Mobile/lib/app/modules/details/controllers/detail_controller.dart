import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DetailsController extends GetxController {
  var cartItems = <Map<String, dynamic>>[].obs; // List untuk menyimpan item keranjang
  var totalAmount = 0.0.obs; // Total biaya

  // Method untuk menambahkan item ke keranjang
  void addItemToCart(String name, int quantity, double price) {
    cartItems.add({'name': name, 'quantity': quantity, 'price': price});
    calculateTotal();
  }

  // Method untuk menghitung total
  void calculateTotal() {
    totalAmount.value = cartItems.fold(0, (sum, item) => sum + (item['price'] * item['quantity']));
  }

  // Simpan pesanan ke database (misal Firebase)
  Future<void> saveOrderToDatabase() async {
    try {
      CollectionReference orders = FirebaseFirestore.instance.collection('orders'); // Ganti 'orders' dengan nama koleksi Anda
      await orders.add({
        'items': cartItems,
        'totalAmount': totalAmount.value,
        'timestamp': FieldValue.serverTimestamp(),
      });
      Get.snackbar('Success', 'Order saved successfully'); // Menampilkan pesan sukses
    } catch (e) {
      Get.snackbar('Error', 'Failed to save order: $e'); // Menampilkan pesan error
    }
  }
}
