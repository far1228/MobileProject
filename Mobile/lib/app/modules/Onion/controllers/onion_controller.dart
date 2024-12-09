import 'package:get/get.dart';

class OnionController extends GetxController {
  var quantity = 1.obs;
  var totalPrice = 15000.obs;
  var toppings = {
    "Sambal": 5000,
    "Kerupuk": 5000,
    "Sayur": 5000,
    "Nasi": 5000
  }.obs;

  void increaseQuantity() {
    quantity++;
    updateTotalPrice();
  }

  void decreaseQuantity() {
    if (quantity > 1) {
      quantity--;
      updateTotalPrice();
    }
  }

  void updateTotalPrice() {
    totalPrice.value = 15000 * quantity.value;
  }
}