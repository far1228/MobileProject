// widgets/teh_widget.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/teh_controller.dart';
import 'package:project_mobile/app/routes/app_routes.dart';

class TehWidget extends StatelessWidget {
  final TehController controller = Get.find<TehController>();

   TehWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/teh.png',
              height: 200,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16),
            Text('Es Teh', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('Ice Tea', style: TextStyle(fontSize: 16, color: Colors.grey)),
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
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  await controller.addToCart();
                  Get.toNamed(Routes.CART); // Navigate to the cart page
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
