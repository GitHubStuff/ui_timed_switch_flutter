library ui_timed_switch;

import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/// A custom StatefulWidget that provides a switch (toggle) which automatically turns off after a specified duration.
///
/// The `UITimedSwitch` is a customizable switch component that allows users to toggle between on/off states with the option for the switch to automatically revert to the off state after a set duration.
///
/// Parameters (Mirrors the Flutter class):
/// - `value`: The initial state of the switch (true for on, false for off).
/// - `onChanged`: Callback function that is called when the switch is toggled.
/// - `duration`: The duration after which the switch automatically toggles back to off if it was turned on.
/// - `activeColor`: The color of the thumb when the switch is on.
/// - `activeTrackColor`: The color of the track when the switch is on.
/// - `inactiveThumbColor`: The color of the thumb when the switch is off.
/// - `inactiveTrackColor`: The color of the track when the switch is off.
/// - `activeThumbImage`: An image to display on the thumb when the switch is on.
/// - `onActiveThumbImageError`: Callback function that executes if an error occurs while loading the active thumb image.
/// - `inactiveThumbImage`: An image to display on the thumb when the switch is off.
/// - `onInactiveThumbImageError`: Callback function that executes if an error occurs while loading the inactive thumb image.
/// - `thumbColor`: Customizable color properties for the thumb based on its state.
/// - `trackColor`: Customizable color properties for the track based on its state.
/// - `trackOutlineColor`: The color of the outline around the track.
/// - `trackOutlineWidth`: The width of the outline around the track.
/// - `thumbIcon`: An icon to display inside the thumb.
/// - `materialTapTargetSize`: Configures the tap target size.
/// - `dragStartBehavior`: Determines the behavior when a dragging gesture starts.
/// - `mouseCursor`: The cursor for when the mouse interacts with the widget.
/// - `focusColor`: The color of the focus highlight.
/// - `hoverColor`: The color of the hover.
/// - `overlayColor`: The splash color produced by taps.
/// - `splashRadius`: The radius of the ink splash.
/// - `focusNode`: An optional focus node to use for requesting focus.
/// - `onFocusChange`: Callback that is called when the focus changes.
/// - `autofocus`: Whether this widget should automatically get focus.
///

/// This widget combines the visual components of a Flutter `Switch` with additional timed functionality.
class UITimedSwitch extends StatefulWidget {
  final Duration duration;
  final bool value;
  final ValueChanged<bool> onChanged;
  final Color? activeColor;
  final Color? activeTrackColor;
  final Color? inactiveThumbColor;
  final Color? inactiveTrackColor;
  final ImageProvider<Object>? activeThumbImage;
  final ImageErrorListener? onActiveThumbImageError;
  final ImageProvider<Object>? inactiveThumbImage;
  final ImageErrorListener? onInactiveThumbImageError;
  final MaterialStateProperty<Color?>? thumbColor;
  final MaterialStateProperty<Color?>? trackColor;
  final MaterialStateProperty<Color?>? trackOutlineColor;
  final MaterialStateProperty<double?>? trackOutlineWidth;
  final MaterialStateProperty<Icon?>? thumbIcon;
  final MaterialTapTargetSize? materialTapTargetSize;
  final DragStartBehavior dragStartBehavior;
  final MouseCursor? mouseCursor;
  final Color? focusColor;
  final Color? hoverColor;
  final MaterialStateProperty<Color?>? overlayColor;
  final double? splashRadius;
  final FocusNode? focusNode;
  final ValueChanged<bool>? onFocusChange;
  final bool autofocus;

  const UITimedSwitch({
    super.key,
    required this.value,
    required this.onChanged,
    this.duration = const Duration(milliseconds: 1250),
    this.activeColor,
    this.activeTrackColor,
    this.inactiveThumbColor,
    this.inactiveTrackColor,
    this.activeThumbImage,
    this.onActiveThumbImageError,
    this.inactiveThumbImage,
    this.onInactiveThumbImageError,
    this.thumbColor,
    this.trackColor,
    this.trackOutlineColor,
    this.trackOutlineWidth,
    this.thumbIcon,
    this.materialTapTargetSize,
    this.dragStartBehavior = DragStartBehavior.start,
    this.mouseCursor,
    this.focusColor,
    this.hoverColor,
    this.overlayColor,
    this.splashRadius,
    this.focusNode,
    this.onFocusChange,
    this.autofocus = false,
  });

  @override
  State<UITimedSwitch> createState() => _UITimedSwitch();
}

/// This is the private State class that goes with UIFlipSwitch.
class _UITimedSwitch extends State<UITimedSwitch> {
  late bool isSwitched = widget.value;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    // Automatically start the timer if the initial state is on.
    if (widget.value) {
      checkTimer();
    }
  }

  @override
  Widget build(BuildContext context) {
    return switchCopy();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  /// Updates the state of the switch and manages the timer for automatic toggle off.
  void onChanged(bool value) {
    setState(() => isSwitched = value);
    checkTimer();
    widget.onChanged(isSwitched);
  }

  /// Checks and resets the timer based on the current state of the switch.
  void checkTimer() {
    if (isSwitched) {
      timer?.cancel();
      timer = Timer(widget.duration, () {
        setState(() {
          isSwitched = false;
          widget.onChanged(isSwitched);
        });
      });
    } else {
      timer?.cancel();
    }
  }

  Widget switchCopy() => Switch(
        value: isSwitched,
        onChanged: onChanged,
        activeColor: widget.activeColor,
        activeTrackColor: widget.activeTrackColor,
        inactiveThumbColor: widget.inactiveThumbColor,
        inactiveTrackColor: widget.inactiveTrackColor,
        activeThumbImage: widget.activeThumbImage,
        onActiveThumbImageError: widget.onActiveThumbImageError,
        inactiveThumbImage: widget.inactiveThumbImage,
        onInactiveThumbImageError: widget.onInactiveThumbImageError,
        thumbColor: widget.thumbColor,
        trackColor: widget.trackColor,
        trackOutlineColor: widget.trackOutlineColor,
        trackOutlineWidth: widget.trackOutlineWidth,
        thumbIcon: widget.thumbIcon,
        materialTapTargetSize: widget.materialTapTargetSize,
        dragStartBehavior: widget.dragStartBehavior,
        mouseCursor: widget.mouseCursor,
        focusColor: widget.focusColor,
        hoverColor: widget.hoverColor,
        overlayColor: widget.overlayColor,
        splashRadius: widget.splashRadius,
        focusNode: widget.focusNode,
        onFocusChange: widget.onFocusChange,
        autofocus: widget.autofocus,
      );
}
