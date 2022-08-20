import 'package:flutter/material.dart';
import 'package:spajam_stech/views/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '線香花火',
      theme: ThemeData(
        fontFamily: 'AoyagiKouzanFontT',
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
