# pin_lock_screen

[![Pub Version](https://img.shields.io/pub/v/pin_lock_screen.svg)](https://pub.dev/packages/pin_lock_screen)
[![GitHub License](https://img.shields.io/github/license/xubair305/pin_lock_screen.svg)](https://github.com/xubair305/pin_lock_screen)

A Flutter package to easily integrate screen lock PIN functionality into your application.

## Features

- User-friendly PIN setup.
- Customizable design to match your app's branding.
- Secure encryption to protect user PIN data.
- Flexible integration options.
- Informative error handling.
- Localization support for international users.

## Getting Started

Follow these steps to get started with `pin_lock_screen`:

![alt text](https://github.com/xubair305/pin_lock_screen/blob/master/images/demo.gif?raw=true)

### 1. Installation

Add `pin_lock_screen` to your `pubspec.yaml` file:

```yaml
dependencies:
  pin_lock_screen: ^latest_version
```

### 2. Usage

```dart

import 'package:pin_lock_screen/pin_lock_screen.dart';

 PinLockScreen(
  correctPin: 1111,
  pinLength: 4,
  onPinMatched: (pin) {},
  onPinChanged: (pin) {},
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
)
