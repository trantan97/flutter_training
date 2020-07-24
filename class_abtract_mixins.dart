//hỗ trợ kế thừa, interface, mixin
import 'dart:convert';

abstract class Animal {
  String name;

  Animal(this.name);

  void eat();
}

class Cat extends Animal {
  String color;

  Cat(String name, this.color) : super(name);

  @override
  void eat() {
    print('Cat $name eat');
  }
}

//mọi lớp trong dart đều được coi là interface  nếu nó được triển khai bởi lớp khác bằng từ khóa implements
// lớp khác đó phải định nghĩa lại mọi phương thức, thuộc tính
class Pet {
  double weight;

  void walk() {
    print('walk');
  }
}
// lớp
class HouseCat extends Cat implements Pet {
  HouseCat(String name, String color) : super(name, color);

  @override
  double weight;

  @override
  void walk() {
    print('$name walk');
  }
}

/*Mixin là một lớp, nó không được sử dụng trực tiếp để tạo ra đối tượng,
 một Mixin chứa các phương thức, thuộc tính dùng để gộp vào một lớp khác.
 Có thể gộp nhiều mixin với từ khóa with, nếu các thuộc tính, phương thức bị trùng, dart sẽ lấy ở
 mixin cuối
*/
mixin MixinA {
  void logA() {
    print('LogA');
  }
  get log => logA();
}

mixin MixinB {
  void logB(){
    print('LogB');
  }
  get log => logB();
}

class MixinAB with MixinA, MixinB {
}
class MixinBA with MixinB, MixinA {
}

main(){
  var ab = MixinAB();
  var ba = MixinBA();
  ab.log;
  ba.log;
}
