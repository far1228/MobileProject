import 'package:flutter/material.dart';

class BestSellerItem extends StatelessWidget {
  final String name;
  final String image;
  const BestSellerItem({super.key, required this.name, required this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 90,
          height: 90,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 4),
        Text(name, style: TextStyle(fontSize: 12, color: Colors.brown)),
      ],
    );
  }
}