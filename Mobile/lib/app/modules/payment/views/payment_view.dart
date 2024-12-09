import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/payment_controller.dart';
import '../widgets/payment_option_widget.dart';

class PaymentView extends GetView<PaymentController> {
  const PaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.amber.shade100,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.orange),
          onPressed: () {
            Get.back();
          },
        ),
        title: const Text(
          'Payment Methods',
          style: TextStyle(
            color: Colors.orange,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Obx(() => PaymentOptionWidget(
              icon: Icons.account_balance_wallet,
              title: 'Cash',
              isSelected: controller.selectedMethod.value == PaymentMethod.cash,
              onTap: () {
                controller.selectMethod(PaymentMethod.cash);
              },
            )),
            const Divider(),
            Obx(() => PaymentOptionWidget(
              icon: Icons.qr_code,
              title: 'QR Code',
              isSelected: controller.selectedMethod.value == PaymentMethod.qrCode,
              onTap: () {
                controller.selectMethod(PaymentMethod.qrCode);
              },
            )),
          ],
        ),
      ),
    );
  }
}