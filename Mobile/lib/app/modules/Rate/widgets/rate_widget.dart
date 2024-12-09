import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_mobile/app/modules/Rate/controllers/rate_controller.dart';
import 'package:video_player/video_player.dart';

class StarRatingWidget extends StatelessWidget {
  const StarRatingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final RateController controller = Get.find();
    return Obx(() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(5, (index) {
          return IconButton(
            icon: Icon(
              Icons.star,
              color: index < controller.rating.value ? Colors.orange : Colors.grey,
            ),
            onPressed: () => controller.setRating(index + 1),
          );
        }),
      );
    });
  }
}

class AddPhotoWidget extends StatelessWidget {
  const AddPhotoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final RateController controller = Get.find();
    return Obx(() {
      return Wrap(
        spacing: 10,
        runSpacing: 10,
        children: [
          // Menampilkan gambar
          ...controller.images.map((file) {
            return Image.file(file, width: 80, height: 80, fit: BoxFit.cover);
          }),

          // Menampilkan video
          ...controller.videos.map((file) {
            return GestureDetector(
              onTap: () {
                // Anda bisa menambahkan logika untuk menampilkan atau memutar video di sini.
              },
              child: SizedBox(
                width: 80,
                height: 80,
                child: VideoWidget(file: file),
              ),
            );
          }),

          // Tombol untuk menambahkan gambar
          GestureDetector(
            onTap: () => controller.addImage(),
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.orange),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(Icons.add_a_photo, color: Colors.orange),
            ),
          ),

          // Tombol untuk merekam video menggunakan kamera
          GestureDetector(
            onTap: () => controller.addVideo(),
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.orange),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(Icons.videocam, color: Colors.orange),
            ),
          ),
        ],
      );
    });
  }
}

// Widget untuk menampilkan video
class VideoWidget extends StatefulWidget {
  final File file;

  const VideoWidget({super.key, required this.file});

  @override
  _VideoWidgetState createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.file(widget.file)
      ..initialize().then((_) {
        setState(() {}); // Setelah controller diinisialisasi, refresh tampilan
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose(); // Pastikan untuk dispose controller saat tidak digunakan
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? AspectRatio(
      aspectRatio: _controller.value.aspectRatio,
      child: VideoPlayer(_controller),
    )
        : Center(child: CircularProgressIndicator()); // Menunggu inisialisasi
  }
}