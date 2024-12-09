// modules/orders/controllers/orders_controller.dart
import 'package:get/get.dart';
import 'package:project_mobile/app/routes/app_routes.dart';

class OrdersController extends GetxController {
  var activeOrders = [
    {
      "name": "Ayam Geprek",
      "price": "Rp 20.000",
      "time": "25 Sept, 01:20 pm",
      "items": 1,
      "image": 'assets/images/geprek.png'
    }
  ].obs;

  void cancelOrder(int index) {
    activeOrders.removeAt(index);
    Get.toNamed(Routes.CANCEL_ORDER);  // Navigasi ke halaman Cancelled Orders
  }
}