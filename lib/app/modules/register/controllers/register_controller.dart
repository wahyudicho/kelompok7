import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  var isTermsAccepted = false.obs;
  var isLoading = false.obs;

  String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'Username is required';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    if (!GetUtils.isEmail(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  String? validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    if (value != passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  void toggleTerms(bool? value) {
    isTermsAccepted.value = value ?? false;
  }

  Future<void> register() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    if (!isTermsAccepted.value) {
      Get.snackbar(
        'Error',
        'You must accept the terms and conditions',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    try {
      isLoading.value = true;
      // Add your registration API call here
      await Future.delayed(const Duration(seconds: 2)); // Simulate API call
      
      Get.snackbar(
        'Success',
        'Account created successfully!',
        backgroundColor: Colors.green,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
      
      // Navigate to next screen after successful registration
      // Get.offAllNamed('/home');
    } catch (e) {
      Get.snackbar(
        'Error',
        'Registration failed. Please try again.',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      isLoading.value = true;
      // Implement Google sign-in logic
      await Future.delayed(const Duration(seconds: 1)); // Simulate API call
    } catch (e) {
      Get.snackbar(
        'Error',
        'Google sign-in failed',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> signInWithApple() async {
    try {
      isLoading.value = true;
      // Implement Apple sign-in logic
      await Future.delayed(const Duration(seconds: 1)); // Simulate API call
    } catch (e) {
      Get.snackbar(
        'Error',
        'Apple sign-in failed',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> signInWithFacebook() async {
    try {
      isLoading.value = true;
      // Implement Facebook sign-in logic
      await Future.delayed(const Duration(seconds: 1)); // Simulate API call
    } catch (e) {
      Get.snackbar(
        'Error',
        'Facebook sign-in failed',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  void navigateToLogin() {
    Get.toNamed('/login');
  }

  void navigateToTerms() {
    Get.toNamed('/terms');
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