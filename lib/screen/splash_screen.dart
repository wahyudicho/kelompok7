import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF002B49), // Warna background biru gelap
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min, // Sesuaikan ukuran kolom dengan konten
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Logo custom menggunakan gambar
            Image.asset(
              'assets/images/color.png', // Path gambar di folder assets
              width: 200, // Tinggi gambar
              fit: BoxFit.contain, // Menjaga proporsi gambar
            ),
            Text(
              'Workoutify',
              style: TextStyle(
                color: Color(0xFFFFA726), // Warna kuning
                fontSize: 36, // Ukuran font lebih besar
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 40), // Jarak antara nama aplikasi dan tombol
            // Tombol Sign Up
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.7, // Lebar tombol responsif
              child: ElevatedButton(
                onPressed: () {
                  print('Sign Up clicked');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFFFA726), // Warna kuning
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16), // Sudut melengkung
                  ),
                ),
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                    color: Colors.white, // Warna teks putih
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            SizedBox(height: 8), // Jarak antar tombol
            // Tombol Login
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.7, // Lebar tombol responsif
              child: OutlinedButton(
                onPressed: () {
                  print('Login clicked');
                },
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16), // Sudut melengkung
                  ),
                ),
                child: Text(
                  'Login',
                  style: TextStyle(
                    color: Color(0xFFFFA726), // Warna teks kuning
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
