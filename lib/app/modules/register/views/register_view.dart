import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF00334D),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: controller.formKey,
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    'Hello!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Sign Up to Start Your\nFit Journey!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 40),
                  _buildTextField(
                    controller: controller.usernameController,
                    hintText: 'Create username',
                    validator: controller.validateUsername,
                  ),
                  const SizedBox(height: 16),
                  _buildTextField(
                    controller: controller.emailController,
                    hintText: 'Your email',
                    validator: controller.validateEmail,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 16),
                  _buildTextField(
                    controller: controller.passwordController,
                    hintText: 'Create password',
                    validator: controller.validatePassword,
                    isPassword: true,
                  ),
                  const SizedBox(height: 16),
                  _buildTextField(
                    controller: controller.confirmPasswordController,
                    hintText: 'Confirm password',
                    validator: controller.validateConfirmPassword,
                    isPassword: true,
                  ),
                  const SizedBox(height: 24),
                  _buildTermsCheckbox(),
                  const SizedBox(height: 24),
                  _buildSignUpButton(),
                  const SizedBox(height: 24),
                  const Text(
                    'Or continue with',
                    style: TextStyle(color: Colors.white70),
                  ),
                  const SizedBox(height: 24),
                  _buildSocialButtons(),
                  const SizedBox(height: 24),
                  _buildLoginLink(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    required String? Function(String?)? validator,
    bool isPassword = false,
    TextInputType? keyboardType,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      keyboardType: keyboardType,
      validator: validator,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
        filled: true,
        fillColor: Colors.white.withOpacity(0.2),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        errorStyle: const TextStyle(color: Colors.redAccent),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      ),
    );
  }

  Widget _buildTermsCheckbox() {
    return Obx(
      () => Row(
        children: [
          Checkbox(
            value: controller.isTermsAccepted.value,
            onChanged: controller.toggleTerms,
            fillColor: MaterialStateProperty.all(Colors.amber),
          ),
          const Text(
            'I agree with all of ',
            style: TextStyle(color: Colors.white),
          ),
          TextButton(
            onPressed: controller.navigateToTerms,
            child: const Text(
              'Terms & Condition',
              style: TextStyle(color: Colors.amber),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSignUpButton() {
    return Obx(
      () => SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          onPressed: controller.isLoading.value ? null : controller.register,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.amber,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            disabledBackgroundColor: Colors.amber.withOpacity(0.6),
          ),
          child: controller.isLoading.value
              ? const SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2,
                  ),
                )
              : const Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
        ),
      ),
    );
  }

  Widget _buildSocialButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildSocialButton(
          'assets/images/google.png',
          controller.signInWithGoogle,
        ),
        const SizedBox(width: 20),
        _buildSocialButton(
          'assets/images/apple.png',
          controller.signInWithApple,
        ),
        const SizedBox(width: 20),
        _buildSocialButton(
          'assets/images/facebook.png',
          controller.signInWithFacebook,
        ),
      ],
    );
  }

  Widget _buildSocialButton(String iconPath, VoidCallback onPressed) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: 50,
        height: 50,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Image.asset(
          iconPath,
          width: 24,
          height: 24,
        ),
      ),
    );
  }

  Widget _buildLoginLink() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Already have an account? ',
          style: TextStyle(color: Colors.white),
        ),
        TextButton(
          onPressed: controller.navigateToLogin,
          child: const Text(
            'Login',
            style: TextStyle(
              color: Colors.amber,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}