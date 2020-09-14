import 'package:example_widget_1/screen_d.dart';
import 'package:flutter/material.dart';

class ScreenC extends StatelessWidget {
  static const routName = "/screen_c";
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          width: 500,
          height: 500,
          color: Colors.teal,
          child: Center(
            child: RaisedButton(
              child: Text("Go D"),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ScreenD  (),
                ));
              },
            ),
          ),
      ),
    );
  }
}
