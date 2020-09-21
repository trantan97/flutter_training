import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'model/student.dart';

enum AddStudentType { EDIT, CREATE }

class AddStudent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AddStudentState();
  }

  static PageRoute getPage({AddStudentType type, Student student}) {
    return MaterialPageRoute(
      builder: (context) => AddStudent(),
      settings: RouteSettings(arguments: {"type": type, "student": student}),
    );
  }
}

class _AddStudentState extends State<AddStudent> {
  Student student;
  bool isCreate;

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> arg = ModalRoute.of(context).settings.arguments;
    isCreate = arg["type"] == AddStudentType.CREATE;
    student = isCreate ? Student(DateTime.now().millisecondsSinceEpoch) : arg["student"];
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(flex: 2),
              Text(isCreate ? "Thêm học sinh" : "Sửa học sinh"),
              Spacer(flex: 1),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Họ tên",
                ),
                onChanged: (value) {
                  student.name = value;
                },
                initialValue: student.name,
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Môn học",
                ),
                initialValue: student.subject,
                onChanged: (value) {
                  student.subject = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Điểm",
                ),
                initialValue: student.point,
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  student.point = value;
                },
              ),
              Spacer(flex: 1),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  RaisedButton(
                    child: Text(isCreate ? "Thêm" : "Cập nhật"),
                    onPressed: () {
                      Navigator.of(context).pop(student);
                    },
                  ),
                  RaisedButton(
                    child: Text("Hủy"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
              ),
              Spacer(flex: 3),
            ],
          ),
        ),
      ),
    );
  }
}
