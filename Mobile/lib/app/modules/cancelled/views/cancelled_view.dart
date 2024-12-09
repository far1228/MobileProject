import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_mobile/app/modules/cancelled/controllers/cancelled_comtroller.dart';
import 'package:project_mobile/app/modules/cancelled/widget/cancelled_item_card.dart';
import 'package:project_mobile/app/routes/app_routes.dart';

class CancelledView extends GetView<CancelledController> {
  // Variable to track the active status
  var activeStatus = 'Cancelled'.obs;

  CancelledView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFC107),
        title: const Text("My Orders", style: TextStyle(color: Colors.white)),
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildStatusButton("Active", 'Active', onPressed: () {
                  activeStatus.value = 'Active';
                  Get.toNamed(Routes.ORDERS); // Navigate to Orders page
                }),
                _buildStatusButton("Completed", 'Completed', onPressed: () {
                  activeStatus.value = 'Completed';
                  Get.toNamed(Routes.COMPLETE); // Navigate to Complete Orders page
                }),
                _buildStatusButton("Cancelled", 'Cancelled', onPressed: () {
                  activeStatus.value = 'Cancelled'; // Set the active status to Cancelled
                  // Stay on the Cancelled Orders page
                }),
              ],
            ),
          ),
          Expanded(
            child: Obx(() {
              return ListView.builder(
                itemCount: controller.canceledOrders.length,
                itemBuilder: (context, index) {
                  final order = controller.canceledOrders[index];
                  return CancelledItemCard(
                    name: order['name'].toString(),
                    price: order['price'].toString(),
                    time: order['time'].toString(),
                    status: order['status'].toString(),
                    items: int.parse(order['items'].toString()),
                    image: order['image'].toString(),
                  );
                },
              );
            }),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFFE95322), // Warna background sesuai gambar
        selectedItemColor: Colors.amber[300], // Warna saat ikon dipilih
        unselectedItemColor: Colors.amber[100], // Warna saat ikon tidak dipilih
        showSelectedLabels: false, // Tidak menampilkan label saat dipilih
        showUnselectedLabels: false, // Tidak menampilkan label saat tidak dipilih
        iconSize: 30,
        currentIndex: 0, // Indeks halaman saat ini (HomePage)
        onTap: (index) {
          if (index == 0) {
            Get.toNamed(Routes.HOMEPAGE); // Navigasi ke halaman Orders
          }
          if (index == 1) {
            Get.toNamed(Routes.ORDERS); // Navigasi ke halaman Orders
          }
          if (index == 2){
            Get.toNamed(Routes.FAVORITE);
          }
          if (index == 3){
            Get.toNamed(Routes.UTAMA);
          }
          // Tambahkan logika untuk halaman lainnya jika diperlukan
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

  Widget _buildStatusButton(String title, String status, {required VoidCallback onPressed}) {
    return Obx(() {
      bool isActive = activeStatus.value == status;
      return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: isActive ? Colors.orange : Colors.grey[300], // Change color based on active status
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Text(title, style: TextStyle(color: isActive ? Colors.white : Colors.grey)), // Text color
      );
    });
  }
}