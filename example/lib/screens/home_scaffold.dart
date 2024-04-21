// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';

import '../gen/assets.gen.dart';

import 'package:ui_timed_switch/ui_timed_switch.dart';

class HomeScaffold extends StatelessWidget {
  const HomeScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: homeWidget(context),
      floatingActionButton: null,
    );
  }

  Widget homeWidget(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 200,
            height: 200,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Assets.images.timedswitch1024.image(),
            ),
          ),
          const SizedBox(height: 20),
          UITimedSwitch(
            value: false,
            onChanged: (state) {
              debugPrint('$state');
            },
          ),
        ],
      ),
    );
  }
}
