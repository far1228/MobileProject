import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// Define a model for CartItem
class CartItem {
  final String itemName;
  final int quantity;
  final int totalPrice;

  CartItem({
    required this.itemName,
    required this.quantity,
    required this.totalPrice,
  });

  Map<String, dynamic> toMap() {
    return {
      'itemName': itemName,
      'quantity': quantity,
      'totalPrice': totalPrice,
    };
  }
}

class TehController extends GetxController {
  var quantity = 1.obs;
  var totalPrice = 5000.obs;
  var cartItems = <CartItem>[].obs; // List to hold cart items

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
    totalPrice.value = 5000 * quantity.value;
  }

  Future<void> addToCart() async {
    // Create a new CartItem
    var cartItem = CartItem(
      itemName: 'Es Teh',
      quantity: quantity.value,
      totalPrice: totalPrice.value,
    );

    // Add the item to the local cartItems list
    cartItems.add(cartItem);

    try {
      // Save the item to Firestore
      await FirebaseFirestore.instance.collection('cart').add(cartItem.toMap());
      Get.snackbar('Success', 'Es Teh added to cart!');
    } catch (e) {
      Get.snackbar('Error', 'Failed to add to cart: $e');
    }
  }
}
