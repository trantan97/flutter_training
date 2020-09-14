import 'dart:async';

import 'package:example_widget_1/screen_b.dart';
import 'package:example_widget_1/screen_c.dart';
import 'package:flutter/material.dart';

class ScreenA extends StatelessWidget {
  static const routName = "/";

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            RaisedButton(
              child: Text("Go A"),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ScreenA(),
                  ),
                );
              },
            ),
            RaisedButton(
              child: Text("Go B"),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ScreenB(),
                  ),
                );
              },
            ),
            RaisedButton(
              child: Text("Go C"),
              onPressed: () {
                Navigator.of(context).push(PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) => ScreenC(),
                  transitionDuration: Duration(milliseconds: 300),
                  transitionsBuilder: (context, animation, secondaryAnimation, child) {
                    return ScaleTransition(
                      child: child,
                      scale: animation,
                    );
                  },
                  barrierColor: null,
                  opaque: false,
                  barrierDismissible: true,
                ));
              },
            ),
            RaisedButton(
              child: Text("Go C with animation"),
              onPressed: () {
                Navigator.of(context).push(PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) => ScreenC(),
                  transitionDuration: Duration(milliseconds: 300),
                  transitionsBuilder: (context, animation, secondaryAnimation, child) {
                    return RotationTransition(
                      child: child,
                      turns: animation,
                    );
                  },
                ));
              },
            ),
            RaisedButton(
              child: Text("Go B by named"),
              onPressed: () {
                Navigator.of(context).pushNamed(ScreenB.routName);
              },
            ),
            RaisedButton(
              child: Text("Go B by named, with data"),
              onPressed: () async {
                final result = await Navigator.of(context).pushNamed(ScreenB.routName, arguments: "data");
                print('Result from B: $result');
              },
            ),
          ],
        ),
      ),
    );
  }
}
