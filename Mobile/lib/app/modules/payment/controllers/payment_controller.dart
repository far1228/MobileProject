import 'package:get/get.dart';

enum PaymentMethod { cash, qrCode }

class PaymentController extends GetxController {
  var selectedMethod = PaymentMethod.cash.obs;

  void selectMethod(PaymentMethod method) {
    selectedMethod.value = method;
  }
}