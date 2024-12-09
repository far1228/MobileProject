// utama_controller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:path/path.dart';

class UtamaController extends GetxController {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController dateOfBirthController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  var profilePicture = 'https://via.placeholder.com/150'.obs; // Default profile picture URL

  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseStorage storage = FirebaseStorage.instance;

  @override
  void onClose() {
    fullNameController.dispose();
    dateOfBirthController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    super.onClose();
  }

  Future<void> createOrUpdateProfile(String id) async {
    await firestore.collection('profiles').doc(id).set({
      'fullName': fullNameController.text,
      'dateOfBirth': dateOfBirthController.text,
      'email': emailController.text,
      'phoneNumber': phoneNumberController.text,
      'profilePicture': profilePicture.value,
    });
    Get.snackbar(
      'Success',
      'Profile updated successfully!',
      snackPosition: SnackPosition.TOP, // Show snackbar at the top
    );
  }

  Future<void> loadProfile(String id) async {
    final doc = await firestore.collection('profiles').doc(id).get();
    if (doc.exists) {
      final data = doc.data();
      fullNameController.text = data?['fullName'] ?? '';
      dateOfBirthController.text = data?['dateOfBirth'] ?? '';
      emailController.text = data?['email'] ?? '';
      phoneNumberController.text = data?['phoneNumber'] ?? '';
      profilePicture.value = data?['profilePicture'] ?? 'https://via.placeholder.com/150';
    }
  }

  Future<void> deleteProfile(String id) async {
    await firestore.collection('profiles').doc(id).delete();

    // Clear fields and reset profile picture after deletion
    fullNameController.clear();
    dateOfBirthController.clear();
    emailController.clear();
    phoneNumberController.clear();
    profilePicture.value = 'https://via.placeholder.com/150'; // Reset to default placeholder

    Get.snackbar(
      'Deleted',
      'Profile deleted successfully',
      snackPosition: SnackPosition.TOP, // Show snackbar at the top
    );
  }

  Future<void> pickImage() async {
    try {
      final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        File imageFile = File(pickedFile.path);
        String fileName = basename(imageFile.path);
        final storageRef = storage.ref().child('profile_pictures/$fileName');

        await storageRef.putFile(imageFile);
        profilePicture.value = await storageRef.getDownloadURL();

        print("New profile picture URL: ${profilePicture.value}");
        Get.snackbar(
          'Success',
          'Profile picture updated!',
          snackPosition: SnackPosition.TOP, // Show snackbar at the top
        );
      } else {
        print("No image selected.");
      }
    } catch (e) {
      print("Error picking image: $e");
      Get.snackbar(
        'Error',
        'Failed to pick or upload image.',
        snackPosition: SnackPosition.TOP, // Show snackbar at the top
      );
    }
  }
}