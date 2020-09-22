import 'package:demo_buoi_6/demo_stream.dart';
import 'package:demo_buoi_6/demo_future.dart';
import 'package:demo_buoi_6/domo_isolate/demo_isolate.dart';
import 'package:demo_buoi_6/future_stream_builder.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DemoIsolate(),
    );
  }
}
