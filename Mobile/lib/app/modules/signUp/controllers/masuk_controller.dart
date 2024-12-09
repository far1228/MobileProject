import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class MasukController extends GetxController {
  // Instance FirebaseAuth dan Firestore
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Text controllers untuk input pengguna
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final mobileNumberController = TextEditingController();
  final dobController = TextEditingController();

  Future<void> registerWithEmail() async {
    // Validasi input
    if (fullNameController.text.trim().isEmpty || 
        emailController.text.trim().isEmpty || 
        passwordController.text.trim().isEmpty) {
      Get.snackbar('Error', 'Please fill all required fields', snackPosition: SnackPosition.BOTTOM);
      return;
    }

    try {
      // Registrasi dengan email dan password
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      String uid = userCredential.user!.uid;

      // Simpan data pengguna ke Firestore
      await _firestore.collection('users').doc(uid).set({
        'email': emailController.text.trim(),
        'name': fullNameController.text.trim(),
        'phone_number': mobileNumberController.text.trim().isEmpty ? null : mobileNumberController.text.trim(), // Opsional
        'role': 'user', // Menyimpan role, default 'user'
        'created_at': FieldValue.serverTimestamp(),
        'dob': dobController.text.trim(), // Optional: menyimpan tanggal lahir
      });

      Get.snackbar("Success", "Account registered successfully");
      Get.offAllNamed('/home');
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Error", "Registration failed: ${e.message ?? 'An unknown error occurred'}", snackPosition: SnackPosition.BOTTOM);
    }
  }

  @override
  void onClose() {
    // Dispose controllers saat controller ditutup
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    dobController.dispose();
    super.onClose();
  }
}
