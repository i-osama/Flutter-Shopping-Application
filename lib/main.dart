import 'package:flutter/material.dart';
import 'package:shop_application/HomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Our Shop",
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
