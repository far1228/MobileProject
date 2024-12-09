// views/food_view.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_routes.dart';
import '../controllers/food_controller.dart';

class FoodView extends GetView<FoodController> {
  const FoodView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFE082), // Background color (light yellow)
      body: GestureDetector(
        onTap: () {
          Get.toNamed(Routes.BAGIAN_DUA);
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // The two capybara-like creatures eating food
              Image.asset(
                'assets/images/capybara.png', // Add the image of the capybaras eating
                height: 200,
              ),
            ],
          ),
        ),
      ),
    );
  }
}