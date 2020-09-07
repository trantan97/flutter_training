import 'package:example_widget_1/list_view_demo/item_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'list_view_demo.dart' as listPerson;

class InfiniteList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _InfiniteListState();
}

class _InfiniteListState extends State {
  final persons = listPerson.generatePerson;
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: (){
            return Future.delayed(Duration(seconds: 3));
          },
          child: ListView.separated(
            controller: scrollController,
            itemCount: persons.length + 1,
            itemBuilder: (context, index) {
              if (index < persons.length) {
                return ItemList(
                  person: persons[index],
                );
              }
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 1),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => Divider(height: 1, thickness: 1),
          ),
        ),
      ),
    );
  }

  void _onScroll() {
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.offset;
    print('------->$currentScroll');
    if (maxScroll - currentScroll <= 100) {
      Future.delayed(Duration(seconds: 3)).then((value) {
        setState(() {
          persons.addAll(listPerson.generatePerson);
        });
      });
    }
  }
}
