import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  var isTermsAccepted = false.obs;

  void register() {
    if (!isTermsAccepted.value) {
      Get.snackbar("Error", "You must accept the terms and conditions");
      return;
    }

    if (passwordController.text != confirmPasswordController.text) {
      Get.snackbar("Error", "Passwords do not match");
      return;
    }

    // Perform registration logic here
    Get.snackbar("Success", "Account created successfully!");
  }

  void signInWithGoogle() {
    // Google sign-in logic
  }

  void signInWithApple() {
    // Apple sign-in logic
  }

  void signInWithFacebook() {
    // Facebook sign-in logic
  }

  void navigateToLogin() {
    // Navigate to login page
    Get.toNamed('/login');
  }

  @override
  void onClose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
