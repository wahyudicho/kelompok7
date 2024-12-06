import 'package:flutter/material.dart';
import 'screen/splash_screen.dart'; // Import file splash_screen.dart

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(), // Panggil tampilan splash screen
    );
  }
}
