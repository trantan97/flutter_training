import 'package:example_widget_1/list_view_demo/item_list.dart';
import 'package:example_widget_1/model/person.dart';
import 'package:flutter/material.dart';

enum CreatedType { DEFAULT, BUILDER, SEPARATED }

class ListViewDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ListViewDemoState();
  final CreatedType type;

  ListViewDemo() : this.type = CreatedType.DEFAULT;

  ListViewDemo.builder() : this.type = CreatedType.BUILDER;

  ListViewDemo.separated() : this.type = CreatedType.SEPARATED {}
}

class _ListViewDemoState extends State<ListViewDemo> {
  final persons = generatePerson;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Builder(
          builder: (context) {
            if (widget.type == CreatedType.BUILDER) {
              return _builder(context);
            }
            if (widget.type == CreatedType.SEPARATED) {
              return _separated(context);
            }
            return _default(context);
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: _addPerson,
          ),
          FloatingActionButton(
            child: Icon(Icons.remove),
            onPressed: _deletePerson,
          ),
        ],
      ),
    );
  }

  Widget _default(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      physics: BouncingScrollPhysics(),
      children: persons.map((person) => ItemList(person: person)).toList(),
    );
  }

  Widget _builder(BuildContext context) {
    return ListView.builder(
      itemCount: persons.length,
      itemBuilder: (context, index) => ItemList(
        person: persons[index],
      ),
    );
  }

  Widget _separated(BuildContext context) {
    return Scrollbar(
      child: ListView.separated(
        itemCount: persons.length,
        itemBuilder: (context, index) => ItemList(
          person: persons[index],
        ),
        separatorBuilder: (context, index) => Divider(height: 1, thickness: 1),
      ),
    );
  }

  void _addPerson() {
    setState(() {
      persons.add(Person("Nguyen Van ${persons.length}", "01234567890${persons.length}"));
    });
  }
  void _deletePerson() {
    setState(() {
      persons.removeLast();
    });
  }
}

List<Person> get generatePerson => List<Person>.generate(
      30,
      (index) => Person("Nguyen Van $index", "01234567890$index"),
    );

class Item extends StatelessWidget {
  final Person person;

  Item({Key key, this.person}) : super(key: key) {
    print('contructor: ${person.name}');
  }

  @override
  Widget build(BuildContext context) {
    print('build ${person.name}');
    return Container(
      color: Colors.orangeAccent,
      margin: EdgeInsets.all(8),
      width: 50,
      height: 50,
      child: Text(person.name),
    );
  }
}
