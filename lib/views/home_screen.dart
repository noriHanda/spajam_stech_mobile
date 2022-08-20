import 'package:flutter/material.dart';
import 'package:spajam_stech/views/input_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          '線香花火',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push<Object?>(
            context,
            MaterialPageRoute<Object?>(
              builder: (context) => InputScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
