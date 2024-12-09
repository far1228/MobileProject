// controllers/login_controller.dart
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginController extends GetxController {
  var isPasswordVisible = false.obs;

  // Toggles password visibility
  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  // Email and password login
  void loginWithEmail(String email, String password) async {
    try {
      // Implement Firebase or your preferred auth provider
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email, password: password);
      Get.snackbar("Success", "Logged in successfully!");
      // Navigate to the home page or dashboard
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  // Google login function
  void loginWithGoogle() async {
    // Add Google sign-in logic here using Firebase Auth or Google Sign-In plugin
    Get.snackbar("Google Sign-In", "Google Sign-In triggered");
  }

  // Reset password
  void resetPassword(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      Get.snackbar("Password Reset", "Password reset email sent!");
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  // Navigate to registration page
  void goToRegistration() {
    Get.toNamed('/registrasi');
  }
}
