import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          '線香花火',
          style: TextStyle(fontSize: 40),
        ),
      ),
    );
  }
}
