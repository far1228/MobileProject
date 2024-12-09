import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_mobile/app/routes/app_routes.dart';
import 'package:project_mobile/app/modules/meal/models/meal_item_model.dart';

class MealItemWidget extends StatelessWidget {
  final MealItem mealItem;

  const MealItemWidget({super.key, required this.mealItem});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (mealItem.name == 'Ayam Bakar') {
          // Navigasi ke halaman Ayam Bakar
          Get.toNamed(Routes.AYAM);
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                child: Image.asset(
                  mealItem.imageUrl,
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  mealItem.name,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  mealItem.description,
                  style: TextStyle(
                    color: Colors.grey[600],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Rp ${mealItem.price}',
                      style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.orange, size: 20),
                        Text(
                          mealItem.rating.toString(),
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}