import 'package:flutter/material.dart';

class SummaryWidget extends StatelessWidget {
  final double subtotal;
  final double taxAndFees;
  final double delivery;
  final double total;

  const SummaryWidget({super.key, 
    required this.subtotal,
    required this.taxAndFees,
    required this.delivery,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Subtotal: Rp ${subtotal.toStringAsFixed(0)}', style: TextStyle(fontSize: 14)),
          SizedBox(height: 4),
          Text('Tax and Fees: Rp ${taxAndFees.toStringAsFixed(0)}', style: TextStyle(fontSize: 14)),
          SizedBox(height: 4),
          Text('Delivery: Rp ${delivery.toStringAsFixed(0)}', style: TextStyle(fontSize: 14)),
          SizedBox(height: 4),
          Divider(),
          Text('Total: Rp ${total.toStringAsFixed(0)}', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}