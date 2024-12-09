import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_mobile/app/modules/cart/models/cart_item.dart'; // Adjust path if necessary
import 'package:project_mobile/app/modules/pesan/controllers/pesan_controller.dart';
import 'package:project_mobile/app/routes/app_routes.dart';

class PesanView extends StatelessWidget {
  const PesanView({super.key});

  @override
  Widget build(BuildContext context) {
    // Mendapatkan instance dari PesanController
    final PesanController controller = Get.put(PesanController());

    return Scaffold(
      backgroundColor: Colors.white, // Background aplikasi
      appBar: AppBar(
        backgroundColor: Color(0xFFF5CB58), // Warna header
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center, // Menengahkan teks
          children: [
            Text(
              'Confirm Order',
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // Navigasi kembali
            Get.back();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Order Summary',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Obx(() => ListView.builder(
                itemCount: controller.cartItems.length,
                itemBuilder: (context, index) {
                  final CartItem item = controller.cartItems[index];
                  return ListTile(
                    leading: Image.network(item.image), // Assuming image is a URL
                    title: Text(item.name),
                    subtitle: Text('Quantity: ${item.quantity}'),
                    trailing: Text('Rp ${item.price}'), // Price per item
                    onLongPress: () {
                      // Menghapus item dari daftar pesanan
                      _showRemoveConfirmationDialog(context, controller, item);
                    },
                  );
                },
              )),
            ),
            SizedBox(height: 10),
            _buildSummaryRow('Subtotal:', 'Rp ${controller.subtotal}'),
            _buildSummaryRow('Tax and Fees:', 'Rp ${controller.taxAndFees}'),
            _buildSummaryRow('Delivery:', 'Rp ${controller.delivery}'),
            Divider(),
            _buildSummaryRow('Total:', 'Rp ${controller.total}', isTotal: true),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Get.toNamed(Routes.DETAILS);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                ),
                child: Text('Pay Now'),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildSummaryRow(String label, String value, {bool isTotal = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: TextStyle(fontSize: isTotal ? 20 : 16, fontWeight: isTotal ? FontWeight.bold : FontWeight.normal)),
        Text(value, style: TextStyle(fontSize: isTotal ? 20 : 16, fontWeight: isTotal ? FontWeight.bold : FontWeight.normal)),
      ],
    );
  }

  void _showRemoveConfirmationDialog(BuildContext context, PesanController controller, CartItem item) {
    Get.defaultDialog(
      title: "Remove Item",
      middleText: "Are you sure you want to remove ${item.name}?",
      onConfirm: () {
        var documentId = item.documentId;
        controller.removeCartItem(documentId!);
        Get.back(); // Close the dialog
      },
      onCancel: () => Get.back(),
    );
  }

  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
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
        if (index == 2) {
          Get.toNamed(Routes.FAVORITE);
        }
        if (index == 3) {
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
    );
  }
}
