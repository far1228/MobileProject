import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_mobile/app/modules/cart/models/cart_item.dart';

class CartController extends GetxController {
  var cartItems = <CartItem>[].obs; // Observable list of cart items
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  void onInit() {
    super.onInit();
    fetchCartItems();
  }

  // Fetch cart items from Firestore
  Future<void> fetchCartItems() async {
    try {
      final snapshot = await firestore.collection('cartItems').get();
      cartItems.value = snapshot.docs
          .map((doc) => CartItem.fromMap(doc.data(), documentId: doc.id))
          .toList();
    } catch (e) {
      print("Error fetching cart items: $e");
    }
  }

  // Add a new item to the cart and store it in Firestore
  Future<void> addCartItem(CartItem item) async {
    try {
      DocumentReference docRef = await firestore.collection('cartItems').add(item.toMap());
      cartItems.add(item.copyWith(documentId: docRef.id));
    } catch (e) {
      print("Error adding cart item: $e");
    }
  }

  // Remove an item from the cart in Firestore and locally
  Future<void> removeCartItem(String documentId) async {
    try {
      await firestore.collection('cartItems').doc(documentId).delete();
      cartItems.removeWhere((item) => item.documentId == documentId);
    } catch (e) {
      print("Error removing cart item: $e");
    }
  }

  // Calculate subtotal, tax, delivery, and total
  double get subtotal => cartItems.fold(0, (sum, item) => sum + (item.price * item.quantity));
  double get taxAndFees => subtotal * 0.1;
  double get delivery => 5000;
  double get total => subtotal + taxAndFees + delivery;
}
