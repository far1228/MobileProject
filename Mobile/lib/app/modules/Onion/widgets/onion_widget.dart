import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_mobile/app/modules/Onion/controllers/onion_controller.dart';
import 'package:project_mobile/app/routes/app_routes.dart';

class OnionWidget extends StatelessWidget {
  final OnionController controller = Get.find<OnionController>();

   OnionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(  // Membungkus Column dengan SingleChildScrollView
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/onion.png',  // Ganti dengan path gambar dari assets
              height: 200,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16),
            Text('Onion Ring', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('Grilled Chicken with Sweet Spices', style: TextStyle(fontSize: 16, color: Colors.grey)),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(() => Text('Rp ${controller.totalPrice.value}', style: TextStyle(fontSize: 24, color: Colors.orange))),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: controller.decreaseQuantity,
                    ),
                    Obx(() => Text('${controller.quantity.value}', style: TextStyle(fontSize: 20))),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: controller.increaseQuantity,
                    ),
                  ],
                )
              ],
            ),
            Divider(),
            Text('Toppings', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Obx(() {
              return Column(
                children: controller.toppings.keys.map((topping) {
                  return ListTile(
                    title: Text(topping),
                    trailing: Text('+Rp ${controller.toppings[topping]}'),
                  );
                }).toList(),
              );
            }),
            SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Get.toNamed(Routes.CART);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text('Add to Cart', style: TextStyle(fontSize: 16)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}