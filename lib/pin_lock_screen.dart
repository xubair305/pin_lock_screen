library pin_lock_screen;

import 'package:flutter/material.dart';
import 'package:pin_lock_screen/utils/type_def.dart';

import 'utils/hidden_dots.dart';
import 'utils/num_pad.dart';

class PinLockScreen extends StatefulWidget {
  const PinLockScreen({
    super.key,
    required this.correctPin,
    required this.pinLength,
    this.onPinMatched,
    this.onPinChanged,
    this.disableDotColor,
    this.wrongPinColor,
    this.fillPinColor,
  });

  @override
  State<PinLockScreen> createState() => _PinLockScreenState();
  final int correctPin;
  final int pinLength;
  final OnPinMatched? onPinMatched;
  final OnPinChanged? onPinChanged;
  final Color? disableDotColor;
  final Color? wrongPinColor;
  final Color? fillPinColor;
}

class _PinLockScreenState extends State<PinLockScreen> {
  String value = '';
  bool? isEnteredCorrect;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          HiddenDots(
            values: value,
            pinLength: widget.pinLength,
            isCorrect: isEnteredCorrect,
            disableDotColor: widget.disableDotColor,
            wrongPinColor: widget.wrongPinColor,
            fillPinColor: widget.fillPinColor,
          ),
          const SizedBox(height: 60),
          NumPad(
            onDelete: _onDelete,
            onNumberTap: _onNumberTap,
          ),
        ],
      ),
    );
  }

  void _onNumberTap(int number) {
    if (value.length < widget.pinLength) {
      setState(() {
        value += number.toString();
        widget.onPinChanged?.call(value);
      });
    }
    if (value.length == widget.pinLength) {
      final isCorrect = int.parse(value) == widget.correctPin;

      isEnteredCorrect = isCorrect;

      if (isCorrect) {
        widget.onPinMatched?.call(int.parse(value));
      }
    }
  }

  void _onDelete() {
    if (value.isNotEmpty) {
      setState(() {
        value = value.substring(0, value.length - 1);
        isEnteredCorrect = null;
        widget.onPinChanged?.call(value);
      });
    }
  }
}
