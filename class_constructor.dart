import 'package:flutter/foundation.dart';

class Person {
  String name;
  String address;

  //Constructor default là một constructor không có tham số Person()

  //Constructor
  /*
  * Một syntactic sugar trong Dart thay thế cho
  *   Person(String name, String address){
  *       this.name = name;
  *       this.address = address;
  * }
  * */
  Person(this.name, this.address);

  //Nếu muốn khai báo nhiều constructor hãy sử dụng một named constructor
  Person.nameOnly(this.name) : this.address = "";

  Person.addressOnly(this.address) : this.name = "";

/*phần : this.this.address = ""
  được gọi là "initializer list" nó sẽ chạy trước phần thân của constructor
  * */
}

/*
Các subclass không kế thừa các constructor của superclass. Nghĩa là nếu superclass có tạo ra 1 constructor,
 nghĩa là subclass cũng phải tạo ra constructor và gọi lại construcor của superclass
 (chỉ cần super 1 constructor của superclass là đủ)
* */
class Vietnamese extends Person {
  Vietnamese(String name, String address) : super.nameOnly(name);
}

/*
* Const constructor
* Nếu muốn tạo ra các object không bao giờ thay đổi.
* Sử dụng một const constructor, và đảm bảo rằng các variable là final
* */

class ImmutablePoint {
  final double x, y;

  const ImmutablePoint(this.x, this.y);
}

/*
* Factory constructors
* khi muốn constructor không phải lúc nào cũng tại một instance mới. vd trong singleton
* */
class Logger {
  static Logger logger;
  final String name;

  Logger._internal(this.name);

  factory Logger(String name) {
    logger ??= Logger._internal(name);
    return logger;
  }
}

//Bổ sung toán tử cascade ..
class CascadeEx {
  int a, b, c, d;
}

//main() {
//  CascadeEx cascadeEx = CascadeEx();
//  //thay vì gọi
//  cascadeEx.a = 1;
//  cascadeEx.b = 1;
//  cascadeEx.c = 1;
//  cascadeEx.d = 1;
//  //ta dùng toán tử cascade ..
//  cascadeEx
//    ..a = 1
//    ..b = 1
//    ..c = 1
//    ..d = 1;
//}
