import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_mobile/app/modules/complete/controllers/complete_controller.dart';
import 'package:project_mobile/app/modules/complete/widget/complete_card.dart';
import 'package:project_mobile/app/routes/app_routes.dart';

class CompleteView extends GetView<CompleteController> {
  // Variable to track the active status
  var activeStatus = 'Completed'.obs;

  CompleteView({super.key});

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
                  activeStatus.value = 'Active'; // Set the active status to Active
                  Get.toNamed(Routes.ORDERS); // Navigate to Orders page
                }),
                _buildStatusButton("Completed", 'Completed', onPressed: () {
                  activeStatus.value = 'Completed'; // Set the active status to Completed
                  // Stay on the current page
                }),
                _buildStatusButton("Cancelled", 'Cancelled', onPressed: () {
                  activeStatus.value = 'Cancelled'; // Set the active status to Cancelled
                  Get.toNamed(Routes.CANCELLED); // Navigate to Cancelled Orders page
                }),
              ],
            ),
          ),
          Expanded(
            child: Obx(() {
              // Debugging output to check the data structure
              print(controller.completeOrders);

              return ListView.builder(
                itemCount: controller.completeOrders.length,
                itemBuilder: (context, index) {
                  final order = controller.completeOrders[index];

                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: CompleteCard( // Using CompleteCard
                      name: order['title'].toString(),
                      price: order['price'].toString(),
                      time: order['date'].toString(),
                      status: order['status'].toString(),
                      items: order['items'].toString(), // Ensure 'items' is an int
                      image: order['image'].toString(), // Ensure to use the correct key for image
                    ),
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
      bool isActive = activeStatus.value == status; // Determine if this button is active
      return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: isActive ? Colors.orange : Colors.grey[300], // Highlight active button
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Text(title, style: TextStyle(color: isActive ? Colors.white : Colors.grey)), // Text color
      );
    });
  }
}