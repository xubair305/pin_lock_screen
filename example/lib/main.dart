import 'package:flutter/foundation.dart';
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
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          PinLockScreen(
            correctPin: 1111,
            pinLength: 4,
            onPinMatched: (correctPin) {
              if (kDebugMode) {
                print(correctPin);
              }
            },
            onPinChanged: (pin) {
              if (kDebugMode) {
                print(pin);
              }
            },
            disableDotColor: Colors.yellow,
            wrongPinDotColor: Colors.red,
            filledPinDotColor: Colors.black,
            buttonElevation: 3,
            dotsShape: BoxShape.rectangle,
            gapBtwDotsAndNumPad: 100,
            buttonBackgroundColor: Colors.cyan,
            buttonForegroundColor: Colors.white,
            buttonBorderRadius: 12,
            buttonSize: const Size(80.0, 80.0),
            numPadVerticalSpacing: 30,
            numPadHorizontalSpacing: 20,
            deleteWidget: const Icon(
              Icons.backspace,
              color: Colors.black,
            ),
            enableDone: true,
            onDoneTap: () {},
          ),
        ],
      ),
    );
  }
}
