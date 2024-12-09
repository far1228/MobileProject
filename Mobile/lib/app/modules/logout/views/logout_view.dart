import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_mobile/app/modules/logout/widgets/logout_widget.dart';
import '../controllers/logout_controller.dart';


class LogoutConfirmationView extends GetView<LogoutController> {
  const LogoutConfirmationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade700,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Profil Header
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                          'https://via.placeholder.com/150', // Ganti dengan link foto profil
                        ),
                      ),
                      const SizedBox(width: 16),
                      const Text(
                        'Mark',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                // Menu List
                Expanded(
                  child: ListView(
                    children: const [
                      ListTile(
                        leading: Icon(Icons.person, color: Colors.amber),
                        title: Text(
                          'My Profile',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      ListTile(
                        leading: Icon(Icons.location_on, color: Colors.amber),
                        title: Text(
                          'Address',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      ListTile(
                        leading: Icon(Icons.payment, color: Colors.amber),
                        title: Text(
                          'Payment',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      ListTile(
                        leading: Icon(Icons.phone, color: Colors.amber),
                        title: Text(
                          'Contact',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // Logout Dialog di bagian bawah
            Align(
              alignment: Alignment.bottomCenter,
              child: LogoutDialogWidget(),
            ),
          ],
        ),
      ),
    );
  }
}