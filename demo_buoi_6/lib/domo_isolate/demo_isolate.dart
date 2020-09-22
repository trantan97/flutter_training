import 'dart:isolate';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DemoIsolate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(),
            RaisedButton(
              child: Text("Start calculate"),
              onPressed: () async {
                ReceivePort receivePort = ReceivePort();
                var isolate = await Isolate.spawn(calculate, receivePort.sendPort);
                receivePort.listen((value) {
                  print('---->$value');
                });
                //tắt isolate : isolate.kill(priority: Isolate.immediate);
                //tạo isolate đơn giản, chạy func minus trên isolate đó và trả về kết quả trên isolate hiện tại.
               final result = await compute(minus, 100000);
                print('compute-result: $result');
              },
            )
          ],
        ),
      ),
    );
  }

  static void calculate(SendPort sendPort) {
    var sum = 0;
    for (var i = 0; i < 1000000; i++) {
      sum += i;
    }
    sendPort.send(sum);
  }
}

int minus(int value) {
  var result = 0;
  for (var i = 0; i < value; i++) {
    result -= i;
  }
  return result;
}
