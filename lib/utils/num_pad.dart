import 'package:flutter/material.dart';

import 'number_button.dart';

class NumPad extends StatelessWidget {
  const NumPad({
    required this.onNumberTap,
    this.onDeleteTap,
    this.onDoneTap,
    this.buttonElevation,
    this.buttonBackgroundColor,
    this.buttonForegroundColor,
    this.buttonSize,
    this.buttonRadius,
    this.numPadVerticalSpacing,
    this.numPadHorizontalSpacing,
    this.deleteWidget,
    this.doneWidget,
    this.enableDone = false,
    super.key,
  });

  final VoidCallback? onDeleteTap;
  final VoidCallback? onDoneTap;

  final OnNumberButtonPressed onNumberTap;
  final double? buttonElevation;
  final Color? buttonBackgroundColor;
  final Color? buttonForegroundColor;
  final Size? buttonSize;
  final double? buttonRadius;
  final double? numPadVerticalSpacing;
  final double? numPadHorizontalSpacing;
  final Widget? deleteWidget;
  final Widget? doneWidget;
  final bool enableDone;

  @override
  Widget build(BuildContext context) {
    final buttonColor = buttonBackgroundColor ?? Colors.white;
    final size = buttonSize ?? const Size(70.0, 70.0);
    final vGap = SizedBox(height: numPadVerticalSpacing ?? 24);
    final hGap = SizedBox(width: numPadHorizontalSpacing ?? 24);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildNumberRow([1, 2, 3], buttonColor, size),
        vGap,
        _buildNumberRow([4, 5, 6], buttonColor, size),
        vGap,
        _buildNumberRow([7, 8, 9], buttonColor, size),
        vGap,
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton(
              onPressed: onDeleteTap,
              style: ButtonStyle(
                foregroundColor: MaterialStatePropertyAll(
                  Theme.of(context).colorScheme.error,
                ),
              ),
              child: deleteWidget ?? const Text('Delete'),
            ),
            hGap,
            NumberButton(
              number: 0,
              size: size,
              color: buttonColor,
              onNumberTap: onNumberTap,
              buttonElevation: buttonElevation,
              foregroundColor: buttonForegroundColor,
              buttonRadius: buttonRadius,
            ),
            hGap,
            doneWidget ??
                TextButton(
                  onPressed: onDoneTap,
                  style: enableDone
                      ? null
                      : TextButton.styleFrom(
                          disabledForegroundColor: Colors.transparent,
                        ),
                  child: const Text('Done'),
                ),
          ],
        ),
      ],
    );
  }

  Widget _buildNumberRow(List<int?> numbers, Color buttonColor, Size size) {
    final hSpacing = numPadHorizontalSpacing ?? 24;

    List<Widget> widgets = [];

    for (int? number in numbers) {
      widgets.addAll([
        NumberButton(
          number: number!,
          size: size,
          color: buttonColor,
          onNumberTap: onNumberTap,
          buttonElevation: buttonElevation,
          foregroundColor: buttonForegroundColor,
          buttonRadius: buttonRadius,
        ),
        SizedBox(width: hSpacing),
      ]);
    }

    if (numbers.isNotEmpty) {
      widgets.removeLast();
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: widgets,
    );
  }
}
