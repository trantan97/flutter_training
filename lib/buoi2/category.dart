import 'dart:math';

import 'package:example_widget_1/my_images.dart';

class Category {
  String name;
  List<SubCategory> subCategories;

  Category({this.name, this.subCategories});

  static List<Category> get generateCategories {
    return List.generate(10, (index) {
      int nameIndex = Random().nextInt(4);
      return Category(
        name: "${nameCategories[nameIndex]} $index",
        subCategories: SubCategory.generateSubCategories,
      );
    });
  }
}

class SubCategory {
  String name;
  int numberDoctor;
  String imagePath;

  SubCategory({this.name, this.numberDoctor, this.imagePath});

  static List<SubCategory> get generateSubCategories {
    return List.generate(20, (index) {
      int subNameIndex = Random().nextInt(2);
      int numberOfDoctor = Random().nextInt(50) + 1;
      int imageIndex = Random().nextInt(3);
      return SubCategory(
        name: nameSubCategories[subNameIndex],
        numberDoctor: numberOfDoctor,
        imagePath: imageSubCategories[imageIndex],
      );
    });
  }
}

final nameCategories = ["Adults", "Children", "Women", "Men"];
final nameSubCategories = ["Cough & Cold", "Heart Specialist"];
//Thay thành ảnh của mình.
final imageSubCategories = [MyImages.avatar, MyImages.image1, MyImages.image2];
