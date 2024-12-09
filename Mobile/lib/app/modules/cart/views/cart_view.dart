import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_mobile/app/modules/cart/controllers/cart_controller.dart';
import 'package:project_mobile/app/modules/cart/widgets/cart_item_widget.dart';
import 'package:project_mobile/app/routes/app_routes.dart';

class CartView extends StatelessWidget {
  final CartController controller = Get.put(CartController());

   CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Cart')),
        backgroundColor: Colors.orange,
      ),
      body: Container(
        color: Color(0xFFE95322),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() => Text(
              'You have ${controller.cartItems.length} items in the cart',
              style: TextStyle(fontSize: 16, color: Colors.white),
            )),
            Expanded(
              child: Obx(() {
                if (controller.cartItems.isEmpty) {
                  return Center(
                    child: Text(
                      'No items in the cart',
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                }
                return ListView.builder(
                  itemCount: controller.cartItems.length,
                  itemBuilder: (context, index) {
                    final item = controller.cartItems[index];
                    return CartItemWidget(
                      image: item.image,
                      name: item.name,
                      price: item.price,
                      date: item.date,
                      quantity: item.quantity,
                      onRemove: () => controller.removeCartItem(item.documentId!),
                    );
                  },
                );
              }),
            ),
            Divider(color: Colors.white),
            _buildSummaryRow('Subtotal', controller.subtotal),
            _buildSummaryRow('Tax and Fees', controller.taxAndFees),
            _buildSummaryRow('Delivery', controller.delivery),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total',
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                ),
                Obx(() => Text(
                  'Rp ${formatCurrency(controller.total.toInt())}',
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                )),
              ],
            ),
            SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Get.toNamed(Routes.PESAN);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0),
                  textStyle: TextStyle(fontSize: 18),
                ),
                child: Text('Checkout'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row _buildSummaryRow(String title, double amount) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
        Text(
          'Rp ${formatCurrency(amount.toInt())}',
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }

  String formatCurrency(int amount) {
    return amount.toString().replaceAllMapped(
      RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
      (Match match) => '${match[1]}.',
    );
  }
}
