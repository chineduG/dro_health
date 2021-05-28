import 'package:dro_health/constants.dart';
import 'package:dro_health/screens/body.dart';
import 'package:dro_health/screens/views/slide_panel.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // MinHeight of the panel
    final panelHeightClosed = MediaQuery.of(context).size.height * 0.1;
    // MaxHeight of the panel
    final panelHeightOpen = MediaQuery.of(context).size.height * 1.0;
    return Scaffold(
        body: SlidingUpPanel(
      isDraggable: true,
      color: kDROColor,
      // Scroll  up background,
      parallaxEnabled: true,

      parallaxOffset: 0,
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(40),
      ),
      minHeight: panelHeightClosed,
      maxHeight: panelHeightOpen,
      body: Body(),
      panelBuilder: (controller) => PanelWidget(
        controller: controller,
      ),
    ));
  }
}
