// views/auth_view.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_mobile/app/routes/app_routes.dart';
import '../controllers/auth_controller.dart';
import '../widget/custom_button.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE65100), // Orange background
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // The capybara-like image
            Image.asset(
              'assets/images/capybara.png', // Add the capybara image here
              height: 200,
            ),
            const SizedBox(height: 30), // Space between image and buttons
            CustomButton(
              text: 'Sign In',
              onPressed: () {
                Get.toNamed(Routes.SIGN_IN); // Navigate to sign-in screen
              },
            ),
            CustomButton(
              text: 'Sign Up',
              onPressed: () {
                Get.toNamed(Routes.SIGN_UP);
              }, // Disable the sign-up button (nullable)
            ),
          ],
        ),
      ),
    );
  }
}