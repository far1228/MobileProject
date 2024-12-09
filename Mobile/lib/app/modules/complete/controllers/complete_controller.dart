import 'package:get/get.dart';

class CompleteController extends GetxController {
  var completeOrders = [
    {
      'title': 'Kari Ayam',
      'date': '29 Nov, 01:20 pm',
      'status': 'Order delivered',
      'items': 2,
      'price': 'Rp 20.000',
      'image': 'assets/images/geprek.png', // Ganti URL dengan referensi aset
    },
    // Tambahkan lebih banyak item jika diperlukan
  ].obs;
}