import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class FutureStreamBuilderDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FutureStreamBuilderDemoState();
  }
}

class _FutureStreamBuilderDemoState extends State<FutureStreamBuilderDemo> {
  Future<String> myFuture;
  StreamController streamController = StreamController();
  int count = 0;

  @override
  void initState() {
    super.initState();
    myFuture = getInfoGitUser();
  }

  @override
  void dispose() {
    streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FutureBuilder(
                future: myFuture,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(
                      snapshot.data,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    );
                  } else if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  }
                  return CircularProgressIndicator();
                },
              ),
              StreamBuilder(
                stream: streamController.stream,
                builder: (context, snapshot) {
                  print("Stream state: ${snapshot.connectionState.toString()}");
                  if (snapshot.hasData) {
                    return Text(snapshot.data.toString());
                  }
                  return Wrap();
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          streamController.add(count++);
        },
      ),
    );
  }

  Future<String> getInfoGitUser() async {
    Dio dio = Dio();
    dio.interceptors.add(LogInterceptor(responseBody: true));
    final response = await dio.get("https://api.github.com/users/flutter");
    return response.data.toString();
  }
}
