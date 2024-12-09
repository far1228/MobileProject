import 'package:flutter/material.dart';

class PaymentOptionWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const PaymentOptionWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.orange),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      trailing: Radio(
        value: isSelected,
        groupValue: true,
        onChanged: (bool? value) {
          onTap();
        },
        activeColor: Colors.orange,
      ),
      onTap: onTap,
    );
  }
}