import 'package:example_widget_1/screen_c.dart';
import 'package:flutter/material.dart';

class ScreenB extends StatelessWidget {
  static const routName = "/screen_b";

  @override
  Widget build(BuildContext context) {
    //get data form A
    final dataFromA = ModalRoute.of(context).settings.arguments;
    print('Data form A: $dataFromA');

    return Container(
      color: Colors.blueAccent,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            RaisedButton(
              child: Text("Replace B"),
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => ScreenB(),
                ));
              },
            ),
            RaisedButton(
              child: Text("Go C by named"),
              onPressed: () {
                Navigator.of(context).pushNamed(ScreenC.routName);
              },
            ),
            RaisedButton(
              child: Text("Back to A with result"),
              onPressed: () {
                Navigator.of(context).pop("result form B");
              },
            ),
          ],
        ),
      ),
    );
  }
}
