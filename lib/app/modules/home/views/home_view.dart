// // bagian chandra

// import 'package:flutter/material.dart';

// import 'package:get/get.dart';

// import '../controllers/home_controller.dart';

// class HomeView extends GetView<HomeController> {
//   const HomeView({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('halo tod'),
//         centerTitle: true,
//       ),
//       body: const Center(
//         child: Text(
//           'HomeView is working',
//           style: TextStyle(fontSize: 20),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF002B3D),
      appBar: AppBar(
        backgroundColor: const Color(0xFF002B3D),
        elevation: 0,
        title: const Text(
          'Hello, [name]',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
        centerTitle: false,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Let's start your workout",
              style: TextStyle(fontSize: 18, color: Colors.white70),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: const Color(0xFFFFC107),
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Today Progress',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Practice:', style: TextStyle(fontSize: 16, color: Colors.black)),
                      Text('2/5', style: TextStyle(fontSize: 16, color: Colors.black)),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Time:', style: TextStyle(fontSize: 16, color: Colors.black)),
                      Text('30 minutes', style: TextStyle(fontSize: 16, color: Colors.black)),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Calories Burned:', style: TextStyle(fontSize: 16, color: Colors.black)),
                      Text('300 cal', style: TextStyle(fontSize: 16, color: Colors.black)),
                    ],
                  ),
                  const SizedBox(height: 10),
                  LinearProgressIndicator(
                    value: 0.4,
                    backgroundColor: Colors.black26,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Today's Schedule",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: [
                  scheduleTile('Push-Ups', '3 sets of 10 reps', 5, Colors.orange),
                  scheduleTile('Squats', '3 sets of 10 reps', 5, Colors.orange),
                  scheduleTile('Sit-Ups', '3 sets of 10 reps', 5, Colors.orange),
                  scheduleTile('Lunges', '3 sets of 10 reps', 5, Colors.white),
                  scheduleTile('Burpees', '3 sets of 10 reps', 5, Colors.white),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF002B3D),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.schedule), label: 'Schedule'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }

  Widget scheduleTile(String title, String subtitle, int minutes, Color color) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: color == Colors.white ? Colors.black : Colors.white),
              ),
              const SizedBox(height: 5),
              Text(
                subtitle,
                style: TextStyle(fontSize: 14, color: color == Colors.white ? Colors.black54 : Colors.white70),
              ),
            ],
          ),
          Text(
            '$minutes minutes',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: color == Colors.white ? Colors.black : Colors.white),
          ),
        ],
      ),
    );
  }
}
