import 'package:example_widget_1/screen_a.dart';
import 'package:example_widget_1/screen_b.dart';
import 'package:example_widget_1/screen_c.dart';
import 'package:example_widget_1/screen_d.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChannels.lifecycle.setMessageHandler((message) {
    print('------>$message');
    return Future.value(message);
  });
  return runApp(
    MaterialApp(
//      home: ScreenA(),
      initialRoute: ScreenA.routName,
      routes: {
        ScreenA.routName: (context) => ScreenA(),
        ScreenB.routName: (context) => ScreenB(),
        ScreenD.routName: (context) => ScreenD(),
      },
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case ScreenC.routName:
            {
              return PageRouteBuilder(
                barrierColor: Colors.white12,
                opaque: false,
                pageBuilder: (context, animation, secondaryAnimation) => ScreenC(),
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  Animation<Offset> _animation = Tween<Offset>(begin: Offset(-1,0),end: Offset.zero).animate(animation);
                  return SlideTransition(
                    position: _animation,
                    child: child,
                  );
                },
              );
            }
          default:
            {
              return MaterialPageRoute(builder: (context) => Container(color: Colors.red,));
            }
        }
      },
    ),
  );
}
