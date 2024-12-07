import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  
  // Reactive variables
  var isPasswordHidden = true.obs;

  // Toggle password visibility
  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  // Function stubs
  void onForgotPassword() {
    Get.snackbar(
      'Forgot Password',
      'Redirecting to password recovery...',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void onLogin() {
    String username = usernameController.text;
    String password = passwordController.text;

    if (username.isNotEmpty && password.isNotEmpty) {
      // Misalnya, navigasi ke halaman berikutnya
      Get.offNamed('/home'); 
    } else {
      Get.snackbar(
        'Error',
        'Username or password cannot be empty',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void loginWithGoogle() {
    print('Login with Google');
  }

  void loginWithApple() {
    print('Login with Apple');
  }

  void loginWithFacebook() {
    print('Login with Facebook');
  }

  void onRegister() {
    print('Register tapped');
  }
}
