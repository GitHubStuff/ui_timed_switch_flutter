import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:ui_timed_switch/ui_timed_switch.dart';

void main() {
  group('UITimedSwitch Tests', () {
    testWidgets('Initial state is respected', (WidgetTester tester) async {
      bool initialValue = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: UITimedSwitch(
              value: initialValue,
              onChanged: (_) {},
            ),
          ),
        ),
      );

      final switchFinder = find.byType(Switch);
      expect(switchFinder, findsOneWidget);
      expect((tester.widget(switchFinder) as Switch).value, initialValue);
    });

    testWidgets('Switch calls onChanged when toggled',
        (WidgetTester tester) async {
      bool currentValue = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: UITimedSwitch(
              value: currentValue,
              onChanged: (newValue) {
                currentValue = newValue;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.byType(Switch));
      await tester.pump();

      expect(currentValue, true);
    });

    testWidgets('Switch turns off after duration', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: UITimedSwitch(
              value: true,
              onChanged: (_) {},
              duration: const Duration(milliseconds: 200),
            ),
          ),
        ),
      );

      // Wait for the timer to tick
      await tester.pump(const Duration(
          milliseconds: 200)); // Match the duration in the UITimedSwitch

      final switchFinder = find.byType(Switch);
      expect((tester.widget(switchFinder) as Switch).value, false);
    });
  });
}
