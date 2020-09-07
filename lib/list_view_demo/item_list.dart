import 'package:example_widget_1/model/person.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ItemList extends StatefulWidget {
  final Person person;

  ItemList({Key key, this.person}) : super(key: key) {
    print('constructor: ${person.name}');
  }

  @override
  State<StatefulWidget> createState() {
    return _ItemListState();
  }
}

class _ItemListState extends State<ItemList> with AutomaticKeepAliveClientMixin {
  bool isChecked = false;

  @override
  void initState() {
    super.initState();
    print('initState: ${widget.person.name}');
  }

  @override
  void dispose() {
    print('dispose: ${widget.person.name}');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return GestureDetector(
      onTap: (){
        print('--->Press: ${widget.person.name}');
      },
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            Checkbox(
              value: isChecked,
              onChanged: (value) {
                setState(() {
                  isChecked = value;
                });
              },
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.person.name,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(widget.person.phoneNumber),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
