import 'package:flutter/material.dart';
import 'package:shop_application/HomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Our Shop",
      theme: ThemeData(
          fontFamily: 'Poppins',
          colorScheme: ColorScheme.fromSeed(
              seedColor: Color.fromARGB(255, 7, 185, 205))),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
