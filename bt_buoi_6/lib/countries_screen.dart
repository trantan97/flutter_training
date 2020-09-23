import 'dart:async';

import 'package:bt_buoi_6/model/country.dart';
import 'package:bt_buoi_6/network.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:transparent_image/transparent_image.dart';

class CountriesScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CountriesScreenState();
  }
}

class _CountriesScreenState extends State<CountriesScreen> {
  Future<List<Country>> _countries;
  StreamController streamController;

  @override
  void initState() {
    super.initState();
    _countries = Network.instance.getCountriesByRegion();
    streamController = StreamController<Country>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Asia Countries")),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<List<Country>>(
              future: _countries,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Country> countries = snapshot.data;
                  return ListView.separated(
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Text(index.toString()),
                        title: Text(countries[index].name),
                        onTap: () {
                          streamController.add(countries[index]);
                        },
                      );
                    },
                    separatorBuilder: (context, index) => Divider(),
                    itemCount: countries.length,
                  );
                } else if (snapshot.hasError) {
                  print(snapshot.error);
                  return Text(snapshot.error.toString());
                }
                return Center(child: CircularProgressIndicator());
              },
            ),
          ),
          Divider(),
          Text(
            "Details",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),
          ),
          Divider(),
          Expanded(
            child: StreamBuilder(
              stream: streamController.stream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  Country country = snapshot.data;
                  return Column(
                    children: [
                      ConstrainedBox(
                        constraints: BoxConstraints(minHeight: 100, maxHeight: 100),
                        child: FadeInImage.memoryNetwork(placeholder: kTransparentImage, image: country.flag),
                      ),
                      Text("${country.name} - ${country.nativeName}"),
                      Text("Capital: ${country.capital}"),
                      Text("Currency: ${country.currencies.first}"),
                      Text("Area: ${country.area} km²"),
                      Text("Population: ${country.population}"),
                    ],
                  );
                }
                return Center(
                  child: Text("Waiting..."),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
