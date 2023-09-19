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
    this.wrongPinDotColor,
    this.filledPinDotColor,
    this.buttonElevation,
    this.dotsShape,
    this.gapBtwDotsAndNumPad,
    this.buttonBackgroundColor,
    this.buttonForegroundColor,
    this.buttonBorderRadius,
    this.buttonSize,
    this.numPadVerticalSpacing,
    this.numPadHorizontalSpacing,
  });

  ///
  /// The correct PIN that the user needs to match.
  ///
  final int correctPin;

  ///
  /// The length of the PIN.
  ///
  final int pinLength;

  ///
  /// Callback when the PIN is matched.
  ///
  final OnPinMatched? onPinMatched;

  ///
  /// Callback when the PIN input changes.
  ///
  final OnPinChanged? onPinChanged;

  ///
  /// Color for disabled (unfilled) PIN dots.
  ///
  final Color? disableDotColor;

  ///
  /// Color for PIN dots when the entered PIN is incorrect.
  ///
  final Color? wrongPinDotColor;

  ///
  /// Color for filled (correctly entered) PIN dots.
  ///
  final Color? filledPinDotColor;

  ///
  /// Elevation value for the number buttons [default is 4].
  ///
  final double? buttonElevation;

  ///
  /// Change shapes of hidden dots [default is BoxShape.circle].
  ///
  final BoxShape? dotsShape;

  ///
  /// Gapping between the Hidden dots and the Number pad [default is 60.0].
  ///
  final double? gapBtwDotsAndNumPad;

  ///
  /// Background color for number buttons.
  ///
  final Color? buttonBackgroundColor;

  ///
  /// Foreground color for number buttons.
  ///
  final Color? buttonForegroundColor;

  ///
  /// Border radius for number buttons.
  ///
  final double? buttonBorderRadius;

  ///
  /// Size of number buttons.
  ///
  final Size? buttonSize;

  ///
  /// Vertical spacing between number buttons in the number pad.
  ///
  final double? numPadVerticalSpacing;

  ///
  /// Horizontal spacing between number buttons in the number pad.
  ///
  final double? numPadHorizontalSpacing;

  @override
  State<PinLockScreen> createState() => _PinLockScreenState();
}

class _PinLockScreenState extends State<PinLockScreen> {
  String value = '';
  bool? isEnteredCorrect;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        HiddenDots(
          values: value,
          pinLength: widget.pinLength,
          isCorrect: isEnteredCorrect,
          disableDotColor: widget.disableDotColor,
          wrongPinColor: widget.wrongPinDotColor,
          fillPinColor: widget.filledPinDotColor,
          dotsShape: widget.dotsShape,
        ),
        SizedBox(height: widget.gapBtwDotsAndNumPad ?? 60),
        NumPad(
          onDelete: _onDelete,
          onNumberTap: _onNumberTap,
          buttonElevation: widget.buttonElevation,
          buttonBackgroundColor: widget.buttonBackgroundColor,
          buttonForegroundColor: widget.buttonForegroundColor,
          buttonRadius: widget.buttonBorderRadius,
          buttonSize: widget.buttonSize,
          numPadVerticalSpacing: widget.numPadVerticalSpacing,
          numPadHorizontalSpacing: widget.numPadHorizontalSpacing,
        ),
      ],
    );
  }

  Future<void> _onNumberTap(int number) async {
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
      } else {
        value = '';
        await Future.delayed(const Duration(milliseconds: 300), () {
          setState(() {
            isEnteredCorrect = null;
          });
        });
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
