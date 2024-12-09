// modules/orders/widgets/order_item_card.dart
import 'package:flutter/material.dart';

class OrderItemCard extends StatelessWidget {
  final String name;
  final String price;
  final String time;
  final String image;
  final VoidCallback? onCancel;

  const OrderItemCard({
    super.key,
    required this.name,
    required this.price,
    required this.time,
    required this.image,
    this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar produk
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(image, width: 60, height: 60, fit: BoxFit.cover),
            ),
            const SizedBox(width: 16),

            // Informasi produk
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Baris untuk Nama dan Tanggal
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Nama produk di atas tanggal
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            time,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Harga dan tombol "Cancel Order"
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  price,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                const Text(
                  "1 item",
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
                const SizedBox(height: 16),
                // Tombol "Cancel Order"
                TextButton(
                  onPressed: onCancel,
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.red,
                  ),
                  child: const Text("Cancel Order"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}