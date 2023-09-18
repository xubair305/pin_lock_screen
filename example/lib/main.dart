import 'package:flutter/material.dart';
import 'package:pin_lock_screen/pin_lock_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PinLockScreen(
        correctPin: 11111,
        pinLength: 5,
        onPinMatched: (pin) {},
        onPinChanged: (pin) {},
        disableDotColor: Colors.yellow,
        wrongPinColor: Colors.orange,
      ),
    );
  }
}
