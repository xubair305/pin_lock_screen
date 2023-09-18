import 'package:flutter/material.dart';

class HiddenDots extends StatelessWidget {
  const HiddenDots({
    required this.values,
    required this.pinLength,
    this.isCorrect,
    this.disableDotColor,
    this.wrongPinColor,
    this.fillPinColor,
    this.dotsShape,
    super.key,
  });

  final String values;
  final int pinLength;
  final bool? isCorrect;
  final Color? disableDotColor;
  final Color? wrongPinColor;
  final Color? fillPinColor;
  final BoxShape? dotsShape;

  @override
  Widget build(BuildContext context) {
    final enteredLength = values.length;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        pinLength,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: index < enteredLength ? 28 : 24,
          width: index < enteredLength ? 28 : 24,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            shape:dotsShape?? BoxShape.circle,
            color: isCorrect != null && !isCorrect!
                ? wrongPinColor ?? Theme.of(context).colorScheme.errorContainer
                : index < enteredLength
                    ? fillPinColor ?? Colors.black
                    : disableDotColor ?? Colors.grey,
          ),
        ),
      ),
    );
  }
}
