import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class GestureDetectorDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GesturePage(),
    );
  }
}

class GesturePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _GesturePageState();
}

class _GesturePageState extends State<GesturePage> {
  String action = "";

  @override
  Widget build(BuildContext context) {
    debugPaintPointersEnabled = false;
    return GestureDetector(
      onTap: _onTap,
      onDoubleTap: _onDoubleTap,
      onLongPress: _onLongPress,
//      onHorizontalDragUpdate: _onHorizontalDragUpdate,
//      onVerticalDragUpdate: _onVerticalDragUpdate,
      onScaleUpdate: _onScaleUpdate,
//      behavior: HitTestBehavior.translucent,

      child: Container(
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.center,
        color: Colors.white,
        child: Text(action),
      ),
    );
  }

  void _onTap() {
    setState(() {
      action = "OnTap";
    });
  }

  void _onDoubleTap() {
    setState(() {
      action = "OnDoubleTap";
    });
  }

  void _onLongPress() {
    setState(() {
      action = "OnLongPress";
    });
  }

  void _onVerticalDragUpdate(DragUpdateDetails details) {
    setState(() {
      action = "vertical:\n"
          " x : ${details.globalPosition.dx.floor()} "
          " y : ${details.globalPosition.dy.floor()} ";
    });
  }

  void _onHorizontalDragUpdate(DragUpdateDetails details) {
    setState(() {
      action = "horizontal:\n"
          " x : ${details.globalPosition.dx.floor()} "
          " y : ${details.globalPosition.dy.floor()} ";
    });
  }

  void _onScaleUpdate(ScaleUpdateDetails details) {
    setState(() {
      action = "Scale: ${details.scale.toStringAsFixed(2)}"
          "\n angle: ${details.rotation.abs() * (180/math.pi)}";
    });
  }
}
