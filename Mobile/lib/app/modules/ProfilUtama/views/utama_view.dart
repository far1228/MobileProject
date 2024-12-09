import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_mobile/app/modules/ProfilUtama/controllers/utama_controller.dart';
import 'package:project_mobile/app/routes/app_routes.dart';
import '../widgets/utama_widget.dart';

class UtamaView extends StatelessWidget {
  const UtamaView({super.key});

  @override
  Widget build(BuildContext context) {
    final UtamaController controller = Get.find<UtamaController>();

    // Load profile data when the view is first opened
    controller.loadProfile('user_id');  // Replace with actual user ID

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange.shade100,
        title: const Text(
          'My Profile',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Obx(() => GestureDetector(
                onTap: controller.pickImage,  // Open image picker when tapped
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(controller.profilePicture.value),
                    ),
                    CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.orange.shade700,
                      child: Icon(Icons.camera_alt, color: Colors.white, size: 15),
                    )
                  ],
                ),
              )),
              const SizedBox(height: 20),

              ProfileTextField(
                label: 'Full Name',
                controller: controller.fullNameController,
              ),
              ProfileTextField(
                label: 'Date of Birth',
                controller: controller.dateOfBirthController,
              ),
              ProfileTextField(
                label: 'Email',
                controller: controller.emailController,
              ),
              ProfileTextField(
                label: 'Phone Number',
                controller: controller.phoneNumberController,
              ),
              const SizedBox(height: 20),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange.shade700,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  controller.createOrUpdateProfile('user_id'); // Replace with actual user ID
                },
                child: const Text('Save Profile'),
              ),

              const SizedBox(height: 10),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red.shade700,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  controller.deleteProfile('user_id'); // Replace with actual user ID
                },
                child: const Text('Delete Profile'),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFFE95322),
        selectedItemColor: Colors.amber[300],
        unselectedItemColor: Colors.amber[100],
        showSelectedLabels: false,
        showUnselectedLabels: false,
        iconSize: 30,
        currentIndex: 2,
        onTap: (index) {
          if (index == 0) {
            Get.toNamed(Routes.HOMEPAGE);
          } else if (index == 1) {
            Get.toNamed(Routes.ORDERS);
          } else if (index == 2) {
            Get.toNamed(Routes.FAVORITE);
          }
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/home.png', width: 30, height: 30),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/orders.png', width: 30, height: 30),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/favorite.png', width: 30, height: 30),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/profile.png', width: 30, height: 30),
            label: '',
          ),
        ],
      ),
    );
  }
}