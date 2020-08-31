import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//câu thần chú: Constraints go down. Sizes go up. Parent set position.

class CommonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            container,
            text,
            button,
            image,
            textFiled,
            stack,
          ],
        ),
      ),
    );
  }

  get container => Center(
        child: Container(
          color: Colors.orange,
          height: 200,
          width: double.infinity,
          alignment: Alignment.centerRight,
          child: Text("AA"),
        ),
      );

  get text => Text(
        "Text",
        style: TextStyle(
          fontSize: 18,
          color: Colors.red,
          fontWeight: FontWeight.bold,
        ),
      );

  get button => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          RaisedButton(
            onPressed: () {},
            child: Text("RaisedButton"),
          ),
          FlatButton(
            onPressed: () {},
            child: Text("FlatButton"),
          ),
          DropdownButton(
            items: [
              DropdownMenuItem(child: Text("Item 1")),
              DropdownMenuItem(child: Text("Item 2")),
              DropdownMenuItem(child: Text("Item 3")),
              DropdownMenuItem(child: Text("Item 4")),
            ],
            onChanged: (value) {},
          )
        ],
      );

  // get image => Image.asset("assets/images/sun_raise.jpg",fit: BoxFit.cover,width: 100,height: 100,);
  get image => Image.network(
        "https://dab1nmslvvntp.cloudfront.net/wp-content/uploads/2016/03/1458289957powerful-images3.jpg",
        fit: BoxFit.cover,
        width: 100,
        height: 100,
      );

  get textFiled => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: TextField(
            enabled: true,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(style: BorderStyle.solid, color: Colors.orange),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(style: BorderStyle.solid, color: Colors.grey),
              ),
              // labelText: "AAA",
              hintText: "Hint",
            ),
            maxLines: 5,
            onChanged: (value) {
              print('--->$value');
            },
          ),
        ),
      );

  get stack => Container(
        width: double.infinity,
        height: 500,
        color: Colors.grey.withOpacity(0.3),
        child: Stack(
          children: <Widget>[
            Positioned(
              bottom: 0,
              right: 0,
              height: 100,
              width: 100,
              child: Container(
                color: Colors.cyan,
              ),
            )
          ],
        ),
      );
}
