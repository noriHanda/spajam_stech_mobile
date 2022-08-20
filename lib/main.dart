import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spajam_stech/views/home_screen.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '線香花火',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'AoyagiKouzanFontT',
        scaffoldBackgroundColor: const Color(0xff48404E),
        primaryColor: const Color(0xff000000),
        textTheme: textTheme,
        primarySwatch: Colors.amber,
      ),
      home: const HomeScreen(),
    );
  }
}

const textTheme = TextTheme(
  bodyMedium: TextStyle(color: Colors.white, fontSize: 28),
);
