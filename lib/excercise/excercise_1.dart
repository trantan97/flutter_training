import 'package:example_widget_1/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExerciseOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = 50.0;
    final time = DateTime.now();
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              MyDate(size: size, time: time),
              WeekDays(size: size, time: time),
              Spacer(),
              AddToCalendar(size: size),
            ],
          ),
        ),
      ),
    );
  }

}

class MyDate extends StatelessWidget {
  final double size;
  final DateTime time;

  const MyDate({Key key, this.size, this.time}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final month = DateFormat.MMM('en').format(time);
    final date = time.day.toString();
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: Color(0xfff0ebf9),
        borderRadius: BorderRadius.circular(size / 4),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            month,
            style: TextStyle(
              color: MyColors.petiteOrchid,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            date,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class WeekDays extends StatelessWidget {
  final double size;
  final DateTime time;

  const WeekDays({Key key, this.size, this.time}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final weekDay = DateFormat.EEEE("en").format(time);
    return Container(
      height: size,
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            weekDay,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Text(
            "10:00 - 12:00 PM",
            style: TextStyle(color: Colors.grey),
          )
        ],
      ),
    );
  }
}

class AddToCalendar extends StatelessWidget {
  final double size;

  const AddToCalendar({Key key, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      padding: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: MyColors.whiteLilac,
        borderRadius: BorderRadius.circular(size / 2),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Add To Calendar",
            style: TextStyle(color: MyColors.purpleHeart),
          ),
          SizedBox(width: 8),
          GestureDetector(
            onTap: () => addCalendarClick(context),
            child: Container(
              width: size * 0.8,
              height: size * 0.8,
              decoration: BoxDecoration(
                color: MyColors.purpleHeart,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.add,
                size: size * 0.4,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
  addCalendarClick(BuildContext context) {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text("Click.."),
      ),
    );
  }
}