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
        scaffoldBackgroundColor: const Color(0xff48404E),
        primaryColor: const Color(0xff000000),
        
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
