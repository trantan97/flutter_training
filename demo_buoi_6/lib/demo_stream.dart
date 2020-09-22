import 'dart:async';

import 'package:flutter/material.dart';

class DemoStream extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DemoStreamState();
  }
}

class _DemoStreamState extends State<DemoStream> {
  StreamController streamController;
  int count = 1;

  @override
  void initState() {
    super.initState();
    streamController = StreamController<int>.broadcast();
  }

  @override
  void dispose() {
    streamController?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RaisedButton(
              child: Text("Start listener"),
              onPressed: listen1,
            ),
            RaisedButton(
              child: Text("Start listener2"),
              onPressed: listen2,
            ),
            RaisedButton(
              child: Text("Add value to Stream"),
              onPressed: () {
                streamController.add(count++);
              },
            ),
          ],
        ),
      ),
    );
  }

  void listen1() {
    streamController.stream.listen((value) {
      print('listen1-----> $value');
    });
  }

  void listen2() {
    streamController.stream.transform(StreamTransformer<int, int>.fromHandlers(
      handleData: (data, sink) {
        sink.add(2 * data);
      },
    )).listen((value) {
      print('listen2-----> $value');
    });
  }
}
