import 'dart:math';

import 'package:example_widget_1/buoi2/category.dart';
import 'package:example_widget_1/doctor_detail.dart';
import 'package:example_widget_1/my_colors.dart';
import 'package:example_widget_1/my_images.dart';
import 'package:flutter/material.dart';

class SearchConsultationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacer(),
              searchView,
              SizedBox(height: 20),
              CategoryView(),
              SizedBox(height: 20),
              doctorView,
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget get searchView {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Find your\nConsultation",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 20),
        TextField(
          autofocus: false,
          decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.search,
                color: Colors.black87,
              ),
              filled: true,
              fillColor: Colors.grey.withOpacity(0.2),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(20),
              ),
              isDense: true,
              hintText: "Search",
              contentPadding: EdgeInsets.symmetric(horizontal: 10)),
        )
      ],
    );
  }

  Widget get doctorView {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Doctors",
          style: TextStyle(fontSize: 26, color: Colors.black),
        ),
        SizedBox(height: 20),
        Container(
          height: 70,
          decoration: BoxDecoration(
            color: MyColors.macaroni.withOpacity(0.2),
            borderRadius: BorderRadius.circular(15),
          ),
          padding: EdgeInsets.all(14),
          child: Row(
            children: <Widget>[
              AspectRatio(
                aspectRatio: 1,
                child: CustomContainer(
                  color: MyColors.macaroni,
                  child: Image.asset(
                    MyImages.avatar,
                    fit: BoxFit.contain,
                  ),
                  radius: 10,
                ),
              ),
              Spacer(
                flex: 1,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Dr. Stefeni Albert",
                    style: TextStyle(color: MyColors.macaroni, fontSize: 18),
                  ),
                  Text(
                    "Heart Speailist",
                    style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Spacer(
                flex: 4,
              ),
              Container(
                decoration: BoxDecoration(
                  color: MyColors.macaroni,
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Text(
                  "Call",
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

class CategoryView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CategoryViewState();
  }
}

class _CategoryViewState extends State<CategoryView> {
  final categories = Category.generateCategories;
  int selectedIndex = 0;
  final controllerSubCategory = ScrollController();
  
  @override
  void initState() {
    super.initState();
    controllerSubCategory.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    final subCategories = categories[selectedIndex].subCategories;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Categories",
          style: TextStyle(fontSize: 26, color: Colors.black),
        ),
        // Expanded(child: Container(color: Colors.black,),),
        categoryList,
        subCategoryList(subCategories),
      ],
    );
  }

  void _onCategoryClick(int index) {
    FocusScope.of(context).unfocus();
    if (selectedIndex != index) {
      setState(() {
        selectedIndex = index;
        controllerSubCategory.animateTo(0,duration: Duration(seconds: 1),curve: Curves.linear);
      });
    }
  }

  Widget get categoryList {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: 40),
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Center(
            child: LabelCategory(
              isSelected: selectedIndex == index,
              label: categories[index].name,
              onClick: () => _onCategoryClick(index),
            ),
          );
        },
      ),
    );
  }

  Widget subCategoryList(var subCategories) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: 200),
      child: ListView.builder(
        controller: controllerSubCategory,
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: subCategories.length,
        itemBuilder: (context, index) {
          return Center(
            child: SubCategoryView(
              subCategory: subCategories[index],
            ),
          );
        },
      ),
    );
  }

  void _onScroll() {
    final maxScroll = controllerSubCategory.position.maxScrollExtent;
    final currentScroll = controllerSubCategory.position.pixels;
    if(maxScroll - currentScroll < 200){
      setState(() {
        categories[selectedIndex].subCategories.addAll(SubCategory.generateSubCategories);
      });
    }
  }
}

class LabelCategory extends StatelessWidget {
  final bool isSelected;
  final String label;
  final Function onClick;

  const LabelCategory({
    Key key,
    this.isSelected = false,
    this.label = "",
    this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? Colors.orange.withOpacity(0.2) : null,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.orange : Colors.black54,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class SubCategoryView extends StatelessWidget {
  final SubCategory subCategory;

  const SubCategoryView({Key key, this.subCategory}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = backGroundColor[Random().nextInt(3)];
    return Container(
      width: 120,
      padding: EdgeInsets.fromLTRB(8, 16, 24, 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: color,
      ),
      margin: EdgeInsets.only(right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            subCategory.name,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          SizedBox(height: 8),
          Text(
            "${subCategory.numberDoctor} Doctors",
            style: TextStyle(color: Colors.white),
          ),
          Spacer(),
          Image.asset(subCategory.imagePath),
        ],
      ),
    );
  }
}

final backGroundColor = [MyColors.petiteOrchid, MyColors.macaroni, MyColors.brinkPink];
