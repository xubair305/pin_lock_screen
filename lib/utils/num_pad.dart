import 'package:flutter/material.dart';

import 'number_button.dart';

class NumPad extends StatelessWidget {
  const NumPad({
    required this.onNumberTap,
    this.onDelete,
    super.key,
  });

  final VoidCallback? onDelete;

  final OnNumberButtonPressed onNumberTap;

  @override
  Widget build(BuildContext context) {
    const buttonColor = Colors.white;
    const size = 70.0;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            NumberButton(
              number: 1,
              size: size,
              color: buttonColor,
              onNumberTap: onNumberTap,
            ),
            NumberButton(
              number: 2,
              size: size,
              color: buttonColor,
              onNumberTap: onNumberTap,
            ),
            NumberButton(
              number: 3,
              size: size,
              color: buttonColor,
              onNumberTap: onNumberTap,
            ),
          ],
        ),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            NumberButton(
              number: 4,
              size: size,
              color: buttonColor,
              onNumberTap: onNumberTap,
            ),
            NumberButton(
              number: 5,
              size: size,
              color: buttonColor,
              onNumberTap: onNumberTap,
            ),
            NumberButton(
              number: 6,
              size: size,
              color: buttonColor,
              onNumberTap: onNumberTap,
            ),
          ],
        ),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            NumberButton(
              number: 7,
              size: size,
              color: buttonColor,
              onNumberTap: onNumberTap,
            ),
            NumberButton(
              number: 8,
              size: size,
              color: buttonColor,
              onNumberTap: onNumberTap,
            ),
            NumberButton(
              number: 9,
              size: size,
              color: buttonColor,
              onNumberTap: onNumberTap,
            ),
          ],
        ),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              onPressed: onDelete,
              style: ButtonStyle(
                foregroundColor: MaterialStatePropertyAll(
                    Theme.of(context).colorScheme.error),
              ),
              child: const Text('Delete'),
            ),
            NumberButton(
              number: 0,
              size: size,
              color: buttonColor,
              onNumberTap: onNumberTap,
            ),
            TextButton(
              onPressed: null,
              style: TextButton.styleFrom(
                disabledForegroundColor: Colors.white,
              ),
              child: const Text('Done'),
            ),
          ],
        ),
      ],
    );
  }
}
