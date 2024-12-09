import 'package:flutter/material.dart';

class CategoryButton extends StatelessWidget {
  final String label;
  final IconData icon;
  const CategoryButton({super.key, required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.orangeAccent,
          radius: 30,
          child: Icon(icon, size: 30, color: Colors.white),
        ),
        SizedBox(height: 8),
        Text(label, style: TextStyle(fontSize: 14, color: Colors.brown)),
      ],
    );
  }
}