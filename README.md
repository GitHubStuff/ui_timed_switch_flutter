# UI Timed Switch

A Flutter package providing a `UITimedSwitch` widget, a customizable switch (toggle) component that automatically reverts to the off position after a specified duration. This widget is useful for scenarios where a temporary switch-on state is required.

## Features

- Automatically turns off after a specified duration.
- Highly customizable: Colors, images, icons, and other visual aspects can be adjusted.
- Callbacks for value changes and focus changes.

## Installation

To use the UI Timed Switch in your Flutter app, add the following to your `pubspec.yaml` file:

```yaml
dependencies:
  ui_timed_switch:
    git: https://github.com/GitHubStuff/ui_timed_switch_flutter.git
```

## Usage

```dart
import 'package:ui_timed_switch/ui_timed_switch.dart';
```

UITimedSwitch can be integrated into your Flutter application like any other widget. Here is a basic example:

```dart
UITimedSwitch(
  value: true, // initial state
  onChanged: (bool newValue) {
    // Handle change in switch state
    debugPrint("Switch State: $newValue");
  },
  duration: Duration(seconds: 5), // switch will turn off after 5 seconds if left on
  activeColor: Colors.green,
  inactiveThumbColor: Colors.red,
)
```

### Parameters

value: The initial state of the switch (true for on, false for off).
onChanged: Callback function that is called when the switch is toggled.
duration: The duration after which the switch automatically toggles back to off if it was turned on.
Customizable visual properties: activeColor, inactiveThumbColor, activeTrackColor, inactiveTrackColor, activeThumbImage, etc.
For more detailed customization, refer to the class documentation in the package.

**NOTE:** This widget takes all the parameters of the flutter [Switch class](https://api.flutter.dev/flutter/material/Switch-class.html).

## Contributing

Contributions are welcome! Please open an issue or submit a pull request with your improvements.

## License

This project is licensed under the MIT License - see the LICENSE.md file for details.
