import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class AyamController extends GetxController {
  var quantity = 1.obs;
  var basePrice = 35000;
  var totalPrice = 35000.obs;
  var toppings = {
    "Sambal": 5000,
    "Kerupuk": 5000,
    "Sayur": 5000,
    "Nasi": 5000
  }.obs;

  void increaseQuantity() {
    quantity.value++;
    updateTotalPrice();
  }

  void decreaseQuantity() {
    if (quantity.value > 1) {
      quantity.value--;
      updateTotalPrice();
    }
  }

  void updateTotalPrice() {
    totalPrice.value = basePrice * quantity.value;
  }

  Future<void> addToCart() async {
    try {
      await FirebaseFirestore.instance.collection('cart').add({
        'item': 'Ayam Bakar',
        'quantity': quantity.value,
        'totalPrice': totalPrice.value,
        'toppings': toppings.keys.toList(),
      });
      Get.snackbar("Success", "Item added to cart");
    } catch (e) {
      Get.snackbar("Error", "Failed to add item to cart");
    }
  }
}
