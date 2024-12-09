import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_mobile/app/modules/Rate/controllers/rate_controller.dart';
import 'package:project_mobile/app/modules/Rate/widgets/rate_widget.dart';


class RateView extends StatelessWidget {
  const RateView({super.key});

  @override
  Widget build(BuildContext context) {
    final RateController controller = Get.find();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
        title: Text("Rate Your Food"),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Ratings",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            StarRatingWidget(),
            SizedBox(height: 20),
            TextField(
              onChanged: (text) => controller.setReview(text),
              decoration: InputDecoration(
                labelText: "Enjoy your meal? Write your experience",
                border: OutlineInputBorder(),
              ),
              maxLines: 4,
            ),
            SizedBox(height: 20),
            AddPhotoWidget(),
            Spacer(),
            ElevatedButton(
              onPressed: () async {
                await controller.submitReview();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
              ),
              child: Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}