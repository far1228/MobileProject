import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_mobile/app/modules/details/controllers/detail_controller.dart';
import 'package:project_mobile/app/routes/app_routes.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key});

  @override
  
  Widget build(BuildContext context) {
    final DetailsController controller = Get.find();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFFF5CB58),
        title: Text('Order Details', style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Order Summary',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Obx(() => Column(
                  children: controller.cartItems
                      .map((item) => orderItem(item['name'], item['quantity'], item['price']))
                      .toList(),
                )),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total', style: TextStyle(fontSize: 16)),
                Obx(() => Text('Rp ${controller.totalAmount}', style: TextStyle(fontWeight: FontWeight.bold))),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Payment Method',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            // Tombol QR Code
            ElevatedButton(
              onPressed: () {
              Get.toNamed(Routes.SCANNER);              
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Warna latar belakang tombol
                foregroundColor: Colors.white, // Warna teks tombol
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text('QR Code'),
            ),
            SizedBox(height: 20),
            Center(
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed(Routes.CANCEL_ORDER);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                  ),
                  child: Text('Cancel Order'),
                ),
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    controller.saveOrderToDatabase();  // Save order to database
                    Get.toNamed(Routes.CONFIRM);      // Navigate to confirmation page
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 255, 191, 117),
                  ),
                  child: Text('Pay Now'),
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              'After 5 minutes you can\'t cancel the order',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, color: Colors.black),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFFE95322),
        selectedItemColor: Colors.amber[300],
        unselectedItemColor: Colors.amber[100],
        showSelectedLabels: false,
        showUnselectedLabels: false,
        iconSize: 30,
        currentIndex: 0,
        onTap: (index) {
          if (index == 0) {
            Get.toNamed(Routes.HOMEPAGE);
          } else if (index == 1) {
            Get.toNamed(Routes.ORDERS);
          } else if (index == 2) {
            Get.toNamed(Routes.FAVORITE);
          } else if (index == 3) {
            Get.toNamed(Routes.UTAMA);
          }
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/home.png',
              width: 30,
              height: 30,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/orders.png',
              width: 30,
              height: 30,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/favorite.png',
              width: 30,
              height: 30,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/profile.png',
              width: 30,
              height: 30,
            ),
            label: '',
          ),
        ],
      ),
    );
  }

  Widget orderItem(String name, int quantity, double price) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(name),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text('$quantity Items'),
            Text('Rp ${price * quantity}'), // Display total price per item
            IconButton(
              icon: Icon(Icons.edit, color: Colors.black),
              onPressed: () {
                // Logic to edit item
              },
            ),
          ],
        ),
      ],
    );
  }
}
