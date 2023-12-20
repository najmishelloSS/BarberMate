import 'package:flutter/material.dart';
import 'booking_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BarberMate',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 17, 1, 45)),
        useMaterial3: true,
      ),
      home: BookingPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
