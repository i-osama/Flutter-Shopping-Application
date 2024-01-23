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
          seedColor: const Color.fromARGB(255, 7, 185, 205),
          primary: const Color.fromARGB(255, 7, 185, 205),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          hintStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 119, 112, 112)),
            borderRadius: BorderRadius.horizontal(
              left: Radius.circular(35),
            ),
          ),
        ),
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
