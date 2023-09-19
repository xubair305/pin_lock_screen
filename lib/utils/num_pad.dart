import 'package:flutter/material.dart';

import 'number_button.dart';

class NumPad extends StatelessWidget {
  const NumPad({
    required this.onNumberTap,
    this.onDelete,
    this.buttonElevation,
    this.buttonBackgroundColor,
    this.buttonForegroundColor,
    this.buttonSize,
    this.buttonRadius,
    this.numPadVerticalSpacing,
    this.numPadHorizontalSpacing,
    super.key,
  });

  final VoidCallback? onDelete;

  final OnNumberButtonPressed onNumberTap;
  final double? buttonElevation;
  final Color? buttonBackgroundColor;
  final Color? buttonForegroundColor;
  final Size? buttonSize;
  final double? buttonRadius;
  final double? numPadVerticalSpacing;
  final double? numPadHorizontalSpacing;

  @override
  Widget build(BuildContext context) {
    final buttonColor = buttonBackgroundColor ?? Colors.white;
    final size = buttonSize ?? const Size(70.0, 70.0);
    final vSizedBox = SizedBox(height: numPadVerticalSpacing ?? 24);
    final hSizedBox = SizedBox(width: numPadHorizontalSpacing ?? 24);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            NumberButton(
              number: 1,
              size: size,
              color: buttonColor,
              onNumberTap: onNumberTap,
              buttonElevation: buttonElevation,
              foregroundColor: buttonForegroundColor,
              buttonRadius: buttonRadius,
            ),
            hSizedBox,
            NumberButton(
              number: 2,
              size: size,
              color: buttonColor,
              onNumberTap: onNumberTap,
              buttonElevation: buttonElevation,
              foregroundColor: buttonForegroundColor,
              buttonRadius: buttonRadius,
            ),
            hSizedBox,
            NumberButton(
              number: 3,
              size: size,
              color: buttonColor,
              onNumberTap: onNumberTap,
              buttonElevation: buttonElevation,
              foregroundColor: buttonForegroundColor,
              buttonRadius: buttonRadius,
            ),
          ],
        ),
        vSizedBox,
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            NumberButton(
              number: 4,
              size: size,
              color: buttonColor,
              onNumberTap: onNumberTap,
              buttonElevation: buttonElevation,
              foregroundColor: buttonForegroundColor,
              buttonRadius: buttonRadius,
            ),
            hSizedBox,
            NumberButton(
              number: 5,
              size: size,
              color: buttonColor,
              onNumberTap: onNumberTap,
              buttonElevation: buttonElevation,
              foregroundColor: buttonForegroundColor,
              buttonRadius: buttonRadius,
            ),
            hSizedBox,
            NumberButton(
              number: 6,
              size: size,
              color: buttonColor,
              onNumberTap: onNumberTap,
              buttonElevation: buttonElevation,
              foregroundColor: buttonForegroundColor,
              buttonRadius: buttonRadius,
            ),
          ],
        ),
        vSizedBox,
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            NumberButton(
              number: 7,
              size: size,
              color: buttonColor,
              onNumberTap: onNumberTap,
              buttonElevation: buttonElevation,
              foregroundColor: buttonForegroundColor,
              buttonRadius: buttonRadius,
            ),
            hSizedBox,
            NumberButton(
              number: 8,
              size: size,
              color: buttonColor,
              onNumberTap: onNumberTap,
              buttonElevation: buttonElevation,
              foregroundColor: buttonForegroundColor,
              buttonRadius: buttonRadius,
            ),
            hSizedBox,
            NumberButton(
              number: 9,
              size: size,
              color: buttonColor,
              onNumberTap: onNumberTap,
              buttonElevation: buttonElevation,
              foregroundColor: buttonForegroundColor,
              buttonRadius: buttonRadius,
            ),
          ],
        ),
        vSizedBox,
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton(
              onPressed: onDelete,
              style: ButtonStyle(
                foregroundColor: MaterialStatePropertyAll(
                    Theme.of(context).colorScheme.error),
              ),
              child: const Text('Delete'),
            ),
            hSizedBox,
            NumberButton(
              number: 0,
              size: size,
              color: buttonColor,
              onNumberTap: onNumberTap,
              buttonElevation: buttonElevation,
              foregroundColor: buttonForegroundColor,
              buttonRadius: buttonRadius,
            ),
            hSizedBox,
            TextButton(
              onPressed: null,
              style: TextButton.styleFrom(
                disabledForegroundColor: Colors.transparent,
              ),
              child: const Text('Done'),
            ),
          ],
        ),
      ],
    );
  }
}
