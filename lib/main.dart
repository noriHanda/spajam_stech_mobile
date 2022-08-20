import 'dart:io';

import 'package:flutter/material.dart';
import 'package:spajam_stech/networking/storage_client.dart';
import 'package:spajam_stech/views/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'gen/assets.gen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
