import 'package:flutter/material.dart';
import 'package:project_mobile/app/modules/snack/models/snack_item_model.dart';
import 'package:get/get.dart';
import 'package:project_mobile/app/routes/app_routes.dart';

class SnackItemWidget extends StatelessWidget {
  final SnackItem snackItem;

  const SnackItemWidget({super.key, required this.snackItem});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if(snackItem.name == 'Onion Ring'){
          Get.toNamed(Routes.ONION);
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
                    snackItem.imageUrl,
                    height: 180,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    snackItem.name,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    snackItem.description,
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
                        'Rp ${snackItem.price}',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.orange, size: 20),
                          Text(
                            snackItem.rating.toString(),
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