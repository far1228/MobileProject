import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_mobile/app/modules/cart/controllers/cart_controller.dart';
import 'package:project_mobile/app/modules/cart/models/cart_item.dart';

class AyamView extends StatelessWidget {
  final CartController cartController = Get.put(CartController());
  final RxInt quantity = 1.obs;
  final int basePrice = 35000;
  final RxInt totalPrice = 35000.obs;

  // Toppings with selection state
  final RxMap<String, bool> toppings = {
    "Sambal": false,
    "Kerupuk": false,
    "Sayur": false,
    "Nasi": false,
  }.obs;

  // Topping prices
  final Map<String, int> toppingPrices = {
    "Sambal": 5000,
    "Kerupuk": 5000,
    "Sayur": 5000,
    "Nasi": 5000,
  };

  AyamView({super.key}) {
    // Update the total price when the toppings or quantity changes
    ever(quantity, (_) => updateTotalPrice());
    ever(toppings, (_) => updateTotalPrice());
  }

  // Calculate total price based on selected toppings and quantity
  void updateTotalPrice() {
    int toppingTotal = toppings.entries
        .where((entry) => entry.value)
        .fold(0, (sum, entry) => sum + toppingPrices[entry.key]!);

    totalPrice.value = (basePrice + toppingTotal) * quantity.value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ayam Bakar'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image and title
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image.asset(
                'assets/images/bakar.png',
                width: double.infinity,
                height: 200.0,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Ayam Bakar',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Obx(() => Text('Rp ${totalPrice.value}',
                style: TextStyle(fontSize: 18, color: Colors.red))),
            SizedBox(height: 5),
            Text('Grilled Chicken with Sweet Spices',
                style: TextStyle(fontSize: 16, color: Colors.grey)),
            SizedBox(height: 10),

            // Toppings selection in horizontal layout
            Text('Toppings', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Column(
              children: toppings.keys.map((topping) {
                return Obx(() => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Topping name and price in a row
                        Row(
                          children: [
                            Checkbox(
                              value: toppings[topping],
                              onChanged: (bool? selected) {
                                toppings[topping] = selected ?? false;
                              },
                            ),
                            Text(topping, style: TextStyle(fontSize: 16)),
                            SizedBox(width: 5),
                            Text(
                              '+ Rp ${toppingPrices[topping]}',
                              style: TextStyle(color: Colors.grey, fontSize: 14),
                            ),
                          ],
                        ),
                      ],
                    ));
              }).toList(),
            ),

            Spacer(),

            // Quantity selector and Add to Cart button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        if (quantity.value > 1) {
                          quantity.value--;
                        }
                      },
                      icon: Icon(Icons.remove_circle_outline),
                    ),
                    Obx(() => Text('${quantity.value}', style: TextStyle(fontSize: 18))),
                    IconButton(
                      onPressed: () {
                        quantity.value++;
                      },
                      icon: Icon(Icons.add_circle_outline),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    // Collect only the selected toppings
                    var selectedToppings = toppings.entries
                        .where((entry) => entry.value)
                        .map((entry) => entry.key)
                        .toList();
                    
                    // Create a CartItem with selected toppings
                    var newItem = CartItem(
                      name: 'Ayam Bakar',
                      price: totalPrice.value,
                      quantity: quantity.value,
                      image: 'assets/images/bakar.png',
                      date: DateTime.now().toString(),
                      toppings: selectedToppings, // Pass selected toppings
                    );

                    // Add the item to the cart
                    cartController.addCartItem(newItem);
                    Get.snackbar("Success", "Ayam Bakar added to cart with toppings");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.shopping_cart),
                      SizedBox(width: 5),
                      Text('Add to Cart'),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
