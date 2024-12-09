import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_mobile/app/routes/app_routes.dart';
import '../controllers/favorite_controller.dart';
import '../widgets/favorite_item_widget.dart';

class FavoriteView extends GetView<FavoriteController> {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text(
          'My Favorite',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            // Aksi tombol kembali
            Get.back();
          },
        ),
      ),
      body: Obx(
            () => ListView.builder(
          itemCount: controller.favoriteItems.length,
          itemBuilder: (context, index) {
            var food = controller.favoriteItems[index];
            return FavoriteItemWidget(foodItem: food);
          },
        ),
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
}