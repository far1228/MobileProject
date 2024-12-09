import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_mobile/app/modules/profile/widgets/profile_item_widget.dart';
import 'package:project_mobile/app/routes/app_routes.dart'; // Pastikan Audio route sudah ada di sini
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade700,
      appBar: AppBar(
        backgroundColor: Colors.orange.shade700, // Warna latar belakang AppBar
        elevation: 0, // Hilangkan bayangan AppBar
        leading: IconButton(
          icon: Icon(Icons.arrow_back), // Ikon kembali
          onPressed: () {
            Get.back(); // Kembali ke halaman sebelumnya (HomePage)
          },
        ),
        title: Text('Profile', style: TextStyle(color: Colors.white)), // Judul AppBar
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profil Header
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Obx(() => CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(controller.userPhoto.value),
                  )),
                  const SizedBox(width: 16),
                  Obx(() => Text(
                    controller.userName.value,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Menu List
            Expanded(
              child: ListView(
                children: [
                  ProfileItemWidget(
                    icon: Icons.shopping_bag,
                    title: 'My Orders',
                    onTap: () {},
                  ),
                  ProfileItemWidget(
                    icon: Icons.person,
                    title: 'My Profile',
                    onTap: () {},
                  ),
                  ProfileItemWidget(
                    icon: Icons.audiotrack, // Ganti ikon dengan ikon audio
                    title: 'Address', // Ubah judul menjadi Audio
                    onTap: () {
                      // Routing ke halaman Audio
                      Get.toNamed(Routes.LOCATION); // Pastikan sudah ada route AUDIO
                    },
                  ),
                  ProfileItemWidget(
                    icon: Icons.payment,
                    title: 'Payment',
                    onTap: () {
                      Get.toNamed(Routes.PAYMENT);
                    },
                  ),
                  ProfileItemWidget(
                    icon: Icons.phone,
                    title: 'Contact',
                    onTap: () {},
                  ),
                  const Divider(color: Colors.white),
                  ProfileItemWidget(
                    icon: Icons.logout,
                    title: 'Log out',
                    onTap: () {
                      // Contoh routing ke halaman login
                      Get.toNamed(Routes.LOGOUT);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}