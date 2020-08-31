import 'package:example_widget_1/common_widget/common_widget.dart';
import 'package:example_widget_1/excercise/excercise_1.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

main() async {
  await initializeDateFormatting("en", null);
  return runApp(
    MaterialApp(
      home: CommonWidget(),
    ),
  );
}
