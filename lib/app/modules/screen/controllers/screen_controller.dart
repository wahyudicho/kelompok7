import 'package:get/get.dart';
import 'package:myapp/app/modules/login/views/login_view.dart';
import 'package:myapp/app/modules/register/views/register_view.dart';

class ScreenController extends GetxController {
  // Fungsi untuk login
  void onLogin() {
    print("Navigating to Login View");
    Get.to(() => const LoginView()); // Navigasi ke LoginView
  }

  // Fungsi untuk sign up
  void onSignUp() {
    print("Navigating to Sign Up View");
    Get.to(() => const RegisterView()); // Navigasi ke SignUpView
  }
}
