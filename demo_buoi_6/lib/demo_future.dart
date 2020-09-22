import 'package:flutter/material.dart';

class DemoFuture extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RaisedButton(
              child: Text("Start a future"),
              onPressed: () {
                Future(myFuture).then((value) => print("myFuture----->$value")).catchError(
                  (e) => print(e),
                  test: (error) {
                    return error is String;
                  },
                );
                print('Press');
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<int> myFuture() async {
    print('Future!!!');
    var sum = 0;
    for (int i = 1; i < 10000; i++) {
      sum += i;
    }
    return sum;
  }
}
