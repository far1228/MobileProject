import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_mobile/app/modules/search/widgets/search_button.dart';
import 'package:project_mobile/app/modules/search/widgets/search_item.dart';
import 'package:project_mobile/app/routes/app_routes.dart';
import '../controllers/search_controller.dart';


class SearchView extends GetView <MySearchController>
{
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.orange),
          onPressed: () {
            Get.back();
          },
        ),
        title: Container(
          height: 40,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.orange),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.tune, color: Colors.orange),
                onPressed: () {
                  // Aksi untuk membuka filter
                },
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Search Results',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                Text(
                  'See More',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.orange,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Expanded(
              child: Obx(
                    () => ListView.builder(
                  itemCount: controller.searchItems.length,
                  itemBuilder: (context, index) {
                    var food = controller.searchItems[index];
                    return SearchItemWidget(searchItem: food);
                  },
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Neighbour's Search",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Text(
                  'More',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.orange,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 40,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: controller.categories.length,
                itemBuilder: (context, index) {
                  var category = controller.categories[index];
                  return SearchButtonWidget(label: category);
                },
              ),
            ),
          ],
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