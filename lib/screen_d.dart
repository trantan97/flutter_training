import 'package:example_widget_1/screen_b.dart';
import 'package:flutter/material.dart';

class ScreenD extends StatefulWidget {
  static const routName = "/screen_d";

  @override
  State<StatefulWidget> createState() => _ScreenDState();
}

class _ScreenDState extends State<ScreenD> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    print('------------dispose');
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print('-------AppLifecycleState: $state');
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.cyan,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RaisedButton(
              child: Text("Go first"),
              onPressed: () {
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
            ),
            RaisedButton(
              child: Text("Go B"),
              onPressed: () {
                Navigator.of(context).popUntil((route) => route.settings.name == ScreenB.routName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
