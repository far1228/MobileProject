import 'package:get/get.dart';

class CancelledController extends GetxController {
  // Daftar pesanan dibatalkan
  final canceledOrders = [
    {
      'name': 'geprek',
      'price': 'Rp 65.000',
      'time': '02 Nov, 04:00 pm',
      'status': 'Order cancelled',
      'items': 3,
      'image': 'assets/images/geprek.png', // Gambar lokal
    },
  ].obs;
}