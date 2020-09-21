import 'dart:math';

import 'package:exercise_5/add_edit_student.dart';
import 'package:exercise_5/model/student.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListStudent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ListStudentState();
}

class _ListStudentState extends State<ListStudent> {
  List<Student> students;

  @override
  void initState() {
    super.initState();
    students = [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.separated(
          itemCount: students.length,
          separatorBuilder: (context, index) {
            return Divider(height: 1, thickness: 1);
          },
          itemBuilder: (context, index) {
            return itemStudent(students[index]);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.blueAccent,
        onPressed: () async {
          final student = await Navigator.of(context).push(AddStudent.getPage(type: AddStudentType.CREATE));
          if (student != null) {
            setState(() {
              students.add(student);
            });
          }
        },
      ),
    );
  }

  Widget itemStudent(Student student) {
    int colorIndex = Random().nextInt(15);
    return InkWell(
      onTap: () async => _editStudent(student),
      onLongPress: () => _deleteStudent(student),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: 60),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.primaries[colorIndex],
              ),
              alignment: Alignment.center,
              margin: EdgeInsets.all(8),
              width: 50,
              height: 50,
              child: Text(
                student.name[0].toUpperCase(),
                style: TextStyle(fontSize: 35, color: Colors.white),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    student.name,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(
                    student.subject,
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            Text(
              student.point,
              style: TextStyle(fontSize: 35, color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _editStudent(Student student) async {
    final result = await Navigator.of(context).push(
      AddStudent.getPage(type: AddStudentType.EDIT, student: student),
    );
    if (result != null) setState(() {});
  }

  Future<void> _deleteStudent(Student student) async{
    final result = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text("Bạn có muốn xóa sinh viên này không?"),
          actions: [
            RaisedButton(
              child: Text("Có"),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
            RaisedButton(
              child: Text("Không"),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
          ],
        );
      },
    );
    if (result == true) {
      setState(() {
        students.removeWhere((e) => e.id == student.id);
      });
    }
  }
}
