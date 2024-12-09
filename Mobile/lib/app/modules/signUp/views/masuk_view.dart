import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_mobile/app/routes/app_routes.dart';
import '../controllers/masuk_controller.dart';
import '../widget/custom_masuk.dart';

class MasukView extends GetView<MasukController> {
  @override
  final MasukController controller = Get.put(MasukController());

   MasukView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE65100),
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Make AppBar transparent
        elevation: 0, // No shadow
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white), // Back icon
          onPressed: () {
            Get.toNamed(Routes.BAGIAN_DUA); // Navigate to BAGIAN_DUA
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 80.0),
                Text(
                  "Sign Up",
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10.0),
                Text(
                  "Enter your details to register",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white70,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 30.0),
                Container(
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Column(
                    children: [
                      CustomMasuk(label: "Full Name", controller: controller.fullNameController),
                      SizedBox(height: 20.0),
                      CustomMasuk(label: "Email", controller: controller.emailController),
                      SizedBox(height: 20.0),
                      CustomMasuk(label: "Password", controller: controller.passwordController, isPassword: true),
                      SizedBox(height: 20.0),
                      ElevatedButton(
                        onPressed: controller.registerWithEmail,
                        child: Text("Sign Up"),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.0),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.SIGN_IN); // Navigate to login page
                    },
                    child: RichText(
                      text: TextSpan(
                        text: "Already have an account?",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                        ),
                        children: [
                          TextSpan(
                            text: "  Login",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
