import 'package:flutter/material.dart';

class CartItemWidget extends StatelessWidget {
  final String image;
  final String name;
  final int price;
  final String date; // Consider using DateTime if you need better control
  final int quantity;
  final VoidCallback onRemove; // Callback untuk menghapus item

  const CartItemWidget({super.key, 
    required this.image,
    required this.name,
    required this.price,
    required this.date,
    required this.quantity,
    required this.onRemove, // Menambahkan parameter
  });

  // Fungsi untuk memformat harga dengan separator ribuan
  String formatCurrency(int amount) {
    return amount.toString().replaceAllMapped(
      RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
      (Match match) => '${match[1]}.',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Card(
        color: Colors.white,
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              // Gambar item
              Image.asset(
                image,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              SizedBox(width: 10),
              // Informasi item
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Nama item
                    Text(
                      name,
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 5),
                    // Harga item
                    Text(
                      'Price: Rp ${formatCurrency(price)}',
                      style: TextStyle(fontSize: 14, color: Colors.black54),
                    ),
                    SizedBox(height: 5),
                    // Kuantitas item
                    Text(
                      'Quantity: $quantity',
                      style: TextStyle(fontSize: 14, color: Colors.black54),
                    ),
                    SizedBox(height: 5),
                    // Total harga item
                    Text(
                      'Total: Rp ${formatCurrency(price * quantity)}',
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    SizedBox(height: 5),
                    // Tanggal item ditambahkan
                    Text(
                      'Date: $date',
                      style: TextStyle(fontSize: 14, color: Colors.black54),
                    ),
                  ],
                ),
              ),
              // Tombol untuk menghapus item
              IconButton(
                icon: Icon(Icons.remove_circle, color: Colors.red),
                onPressed: onRemove, // Memanggil fungsi untuk menghapus item
              ),
            ],
          ),
        ),
      ),
    );
  }
}
