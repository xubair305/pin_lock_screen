import 'package:flutter/material.dart';

typedef OnNumberButtonPressed = void Function(int number);

class NumberButton extends StatelessWidget {
  const NumberButton({
    required this.number,
    required this.size,
    required this.color,
    required this.onNumberTap,
    this.buttonElevation,
    super.key,
  });
  final int number;
  final double size;
  final Color color;
  final OnNumberButtonPressed onNumberTap;
  final double? buttonElevation;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(size / 2),
          ),
          elevation: buttonElevation ?? 4,
          surfaceTintColor: Colors.white,
        ),
        onPressed: () {
          onNumberTap(number);
        },
        child: Center(
          child: Text(
            number.toString(),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 30,
            ),
          ),
        ),
      ),
    );
  }
}
