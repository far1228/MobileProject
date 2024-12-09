import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class RateController extends GetxController {
  RxInt rating = 0.obs;
  RxString review = ''.obs;
  RxList<File> images = <File>[].obs;
  RxList<File> videos = <File>[].obs;  // Menambahkan list untuk video

  final ImagePicker picker = ImagePicker();

  // Method untuk set rating
  void setRating(int value) {
    rating.value = value;
  }

  // Method untuk set review
  void setReview(String value) {
    review.value = value;
  }

  // Menambahkan gambar dari kamera atau galeri
  Future<void> addImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      images.add(File(pickedFile.path));
    }
  }

  // Menambahkan video yang direkam dari kamera
  Future<void> addVideo() async {
    final pickedFile = await picker.pickVideo(source: ImageSource.camera);
    if (pickedFile != null) {
      videos.add(File(pickedFile.path));
    }
  }

  // Method untuk mengunggah file ke Firebase Storage
  Future<String> uploadFile(File file, String fileType) async {
    try {
      String fileName = '${DateTime.now().millisecondsSinceEpoch}.$fileType';
      Reference storageReference = FirebaseStorage.instance.ref().child('uploads/$fileName');
      UploadTask uploadTask = storageReference.putFile(file);
      TaskSnapshot taskSnapshot = await uploadTask;
      String downloadUrl = await taskSnapshot.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      throw Exception('Error uploading file: $e');
    }
  }

  // Method untuk submit review beserta gambar/video
  Future<void> submitReview() async {
    try {
      // Mengunggah gambar dan video jika ada
      List<String> imageUrls = [];
      for (var image in images) {
        String imageUrl = await uploadFile(image, 'jpg');  // Mengunggah gambar dengan ekstensi .jpg
        imageUrls.add(imageUrl);
      }

      List<String> videoUrls = [];
      for (var video in videos) {
        String videoUrl = await uploadFile(video, 'mp4');  // Mengunggah video dengan ekstensi .mp4
        videoUrls.add(videoUrl);
      }

      // Menyimpan data ke Firestore
      await FirebaseFirestore.instance.collection('reviews').add({
        'rating': rating.value,
        'review': review.value,
        'images': imageUrls,
        'videos': videoUrls,
        'timestamp': FieldValue.serverTimestamp(),
      });

      Get.snackbar('Success', 'Review submitted successfully!');
    } catch (e) {
      Get.snackbar('Error', 'Failed to submit review: $e');
    }
  }
}