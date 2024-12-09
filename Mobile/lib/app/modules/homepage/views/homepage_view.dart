import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_mobile/app/routes/app_routes.dart';
import '../controllers/homepage_controller.dart';
import '../widget/best_seller_item.dart';

class HomePageView extends GetView<HomePageController> {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5CB58),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFFE95322), // Warna background sesuai gambar
        selectedItemColor: Colors.amber[300], // Warna saat ikon dipilih
        unselectedItemColor: Colors.amber[100], // Warna saat ikon tidak dipilih
        showSelectedLabels: false, // Tidak menampilkan label saat dipilih
        showUnselectedLabels: false, // Tidak menampilkan label saat tidak dipilih
        iconSize: 30,
        currentIndex: 0, // Indeks halaman saat ini (HomePage)
        onTap: (index) {
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top section with Hi, Name and icons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Hi Farah!",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Row(
                      children: [
                        Image.asset(
                          'assets/icons/notification.png',
                          width: 24,
                          height: 24,
                        ),
                        SizedBox(width: 10),
                        GestureDetector(
                          onTap: (){
                            Get.toNamed(Routes.CART);
                          },
                          child: Image.asset(
                            'assets/icons/cart.png',
                            width: 24,
                            height: 24,
                          ),
                        ),
                        SizedBox(width: 10),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(Routes.PROFIL);
                          },
                          child: Image.asset(
                            'assets/icons/setting.png',
                            width: 24,
                            height: 24,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20),
                // Search bar with GestureDetector to navigate to Search page
                GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.SEARCH); // Navigasi ke halaman pencarian
                  },
                  child: TextField(
                    enabled: false, // Disable the TextField interaction
                    decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                     prefixIcon: Icon(Icons.search, color: Colors.grey),
                      hintText: 'Search',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide.none,
                        ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                // Category buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Meal Category
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.MEAL); // Navigasi ke halaman meal
                      },
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Color(0xFFFFF4E1),
                              shape: BoxShape.circle,
                            ),
                            child: Image.asset(
                              'assets/icons/meal.png',
                              width: 40,
                              height: 40,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Meal',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.brown,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Snack Category
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.SNACK); // Navigasi ke halaman meal
                      },
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Color(0xFFFFF4E1),
                              shape: BoxShape.circle,
                            ),
                            child: Image.asset(
                              'assets/icons/snack.png',
                              width: 40,
                              height: 40,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Snack',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.brown,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Drinks Category
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.DRINK);
                      },
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Color(0xFFFFF4E1),
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset(
                            'assets/icons/drink.png',
                            width: 40,
                            height: 40,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Drinks',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.brown,
                          ),
                        ),
                      ],
                    ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                // Best Seller section
                Text(
                  "Best Seller",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: 120,
                  child: Obx(() {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.bestSellers.length,
                      itemBuilder: (context, index) {
                        var item = controller.bestSellers[index];
                        return Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: BestSellerItem(
                            name: item['name']!,
                            image: item['image']!,
                          ),
                        );
                      },
                    );
                  }),
                ),
                SizedBox(height: 20),
                // Special offer section
                Container(
                  width: double.infinity,
                  height: 180,
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage('assets/images/geprek.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "Experience our delicious new dish\n30% OFF",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                // Recommended section
                Text(
                  "Recommend",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                ),
                SizedBox(height: 10),
                Obx(() {
                  return GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: controller.recommended.length,
                    itemBuilder: (context, index) {
                      var item = controller.recommended[index];
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage('assets/images/geprek.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "${item['name']}",
                                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "\$${item['price']}",
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}