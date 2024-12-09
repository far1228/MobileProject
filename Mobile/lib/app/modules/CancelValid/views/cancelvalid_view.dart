import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_mobile/app/modules/CancelValid/controllers/cancelvalid_controller.dart';

class CancelvalidView extends GetView<CancelValidController> {
  const CancelvalidView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFCC55), // Same background color
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.red),
          onPressed: () {
            // Navigate to the homepage instead of going back
            Get.toNamed('/homepage'); // Adjust the route name as per your routing setup
          },
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 80), // Adjust the height to position the icon higher
          Center(
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.black,
                  width: 2.0,
                ),
              ),
              child: Center(
                child: Icon(
                  Icons.close,
                  size: 80,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          SizedBox(height: 40),  // Spacing between the icon and text
          Text(
            'Order Cancelled!',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Your order has been successfully cancelled',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
          Spacer(),  // Pushes the bottom text down
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              'If you have any question reach directly to our customer support',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 30), // Space at the bottom of the screen
        ],
      ),
    );
  }
}
