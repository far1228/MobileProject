import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_mobile/app/modules/snack/controllers/snack_controller.dart';
import 'package:project_mobile/app/modules/snack/widgets/snack_item.dart';
import 'package:project_mobile/app/routes/app_routes.dart';

class SnackView extends StatelessWidget {
  final SnackController controller = Get.put(SnackController());

   SnackView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Column(
        children: [
          // Kategori tombol bagian atas dengan desain melengkung
          _buildCategorySection(),
          Expanded(
            child: Obx(
                  () => ListView.builder(
                itemCount: controller.snackItems.length,
                itemBuilder: (context, index) {
                  var meal = controller.snackItems[index];
                  return SnackItemWidget(snackItem: meal);
                },
              ),
            ),
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

  // Widget untuk bagian kategori dengan desain melengkung
  Widget _buildCategorySection() {
    return Stack(
      children: [
        // Background melengkung dengan warna E95322
        ClipPath(
          clipper: CategoryClipper(),
          child: Container(
            height: 150,
            color: Color(0xFFE95322),  // Warna oranye E95322
          ),
        ),
        Positioned(
          top: 20,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Kategori Meal
              GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.MEAL); // Navigasi ke halaman Meal
                },
                child: _buildCategoryItem(
                  Icons.restaurant_menu,
                  'Meal',
                  Colors.red,
                  Colors.orange.shade100,
                ),
              ),

              // Kategori Snack
              GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.SNACK); // Navigasi ke halaman Snack
                },
                child: _buildCategoryItem(
                  Icons.fastfood_outlined,
                  'Snack',
                  Color(0xFFF44336),
                  Colors.amber,
                ),
              ),

              // Kategori Drinks
              GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.DRINK); // Navigasi ke halaman Drinks
                },
                child: _buildCategoryItem(
                  Icons.local_drink_outlined,
                  'Drinks',
                  Colors.red,
                  Colors.orange.shade100,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }


  // Widget untuk item kategori dengan warna kustom
  Widget _buildCategoryItem(IconData icon, String label, Color iconColor, Color backgroundColor) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: backgroundColor,
          radius: 40,
          child: Icon(icon, color: iconColor, size: 40),
        ),
        SizedBox(height: 5),
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  // AppBar dengan field pencarian kecil dan ikon pengaturan di dalam search bar
  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.amber.shade400,  // Warna kuning untuk AppBar
      elevation: 0,
      title: Row(
        children: [
          Expanded(
            child: Container(
              height: 40,  // Ukuran lebih kecil untuk search bar
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),  // Sudut melengkung
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Icon(Icons.search, color: Colors.grey),  // Ikon pencarian
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search',  // Teks di dalam pencarian
                        border: InputBorder.none,  // Hilangkan border default
                      ),
                    ),
                  ),
                  // Ikon pengaturan di dalam search bar
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Color(0xFFE95322),  // Warna oranye untuk tombol
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: Icon(Icons.tune, color: Colors.white),  // Ikon pengaturan
                      onPressed: () {
                        // Aksi ketika tombol ditekan
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      actions: [
        // Tombol lonceng, shop, dan titik tiga di sisi kanan
        IconButton(
          icon: Icon(Icons.notifications_outlined, color: Colors.orange),  // Ikon lonceng
          onPressed: () {
            // Aksi ketika ikon lonceng ditekan
          },
        ),
        IconButton(
          icon: Icon(Icons.shopping_bag_outlined, color: Colors.white),  // Ikon shop
          onPressed: () {
            Get.toNamed(Routes.CART);
          },
        ),
        IconButton(
          icon: Icon(Icons.more_vert, color: Colors.white),  // Ikon titik tiga
          onPressed: () {
            Get.toNamed(Routes.PROFIL);
          },
        ),
      ],
    );
  }

  // BottomNavigationBar dengan ikon oranye dan kuning
  }


// Custom clipper untuk background melengkung
class CategoryClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 40);
    var firstControlPoint = Offset(size.width / 2, size.height);
    var firstEndPoint = Offset(size.width, size.height - 40);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}