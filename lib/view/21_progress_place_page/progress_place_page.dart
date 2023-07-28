import 'package:flutter/material.dart';

import 'widget_map.dart';

class ProgressPlacePage extends StatelessWidget {
  const ProgressPlacePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        alignment: Alignment.center,
        children: [
          WidgetMap(),
          // WidgetSearchBar(),
          // WidgetMenuButton(),
          // Drawer(),
        ],
      ),
    );
  }
}