import 'package:flutter/material.dart';
import 'package:project_mobile/app/modules/favorite/models/favorite_model.dart';


class FavoriteItemWidget extends StatelessWidget {
  final Favorite foodItem;

  const FavoriteItemWidget({super.key, required this.foodItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 3,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Gambar makanan
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              foodItem.imageUrl,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 10),
          // Informasi makanan
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  foodItem.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Text(
                  foodItem.description,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
                Text(
                  'Rp ${foodItem.price}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
          // Icon favorite
          Icon(
            Icons.favorite,
            color: Colors.red,
            size: 30,
          ),
        ],
      ),
    );
  }
}