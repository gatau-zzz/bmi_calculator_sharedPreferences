import 'package:flutter/material.dart';
import 'screens/user_input.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // hilangkan banner debug
      title: 'BMI Calculator',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const UserInput(), // halaman utama
    );
  }
}
