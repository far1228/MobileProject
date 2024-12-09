// views/login_view.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_mobile/app/routes/app_routes.dart';
import '../controllers/login_controller.dart';
class LoginView extends GetView<LoginController> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD04900), // Set background color
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Make AppBar background transparent
        elevation: 0, // Remove AppBar shadow
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white), // Back icon
          onPressed: () {
            Get.back(); // Navigate back to the previous screen
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            Obx(() => TextField(
              controller: passwordController,
              obscureText: !controller.isPasswordVisible.value,
              decoration: InputDecoration(
                labelText: 'Password',
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                suffixIcon: IconButton(
                  icon: Icon(controller.isPasswordVisible.value
                      ? Icons.visibility
                      : Icons.visibility_off),
                  onPressed: controller.togglePasswordVisibility,
                ),
              ),
            )),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Trigger login function
                controller.loginWithEmail(
                  emailController.text.trim(),
                  passwordController.text.trim(),
                );
                // Navigate to Homepage
                Get.toNamed(Routes.HOMEPAGE);
              },
              child: const Text('Sign In'),
            ),
            const SizedBox(height: 20.0),
            // Google login button
            IconButton(
              icon: Image.asset('assets/icons/google.png'),
              onPressed: controller.loginWithGoogle,
            ),
            const SizedBox(height: 20.0),
            // Forgot password link
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () async {
                  String? email = await _showForgotPasswordDialog(context);
                  if (email != null && email.isNotEmpty) {
                    controller.resetPassword(email);
                  }
                },
                child: const Text(
                  "Forgot Password?",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            // Register link
            Center(
              child: GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.SIGN_UP); // Navigate to sign-up page
                },
                child: RichText(
                  text: const TextSpan(
                    text: "Don't have an account?",
                    style: TextStyle(color: Colors.white),
                    children: [
                      TextSpan(
                        text: " Register",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<String?> _showForgotPasswordDialog(BuildContext context) async {
    String? email;
    await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Reset Password"),
          content: TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              labelText: "Enter your email",
              border: OutlineInputBorder(),
            ),
            onChanged: (value) {
              email = value;
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(email);
              },
              child: const Text("Submit"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cancel"),
            ),
          ],
        );
      },
    );
    return email;
  }
}
