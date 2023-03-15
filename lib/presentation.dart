import 'package:flutter/material.dart';

import 'package:flutter_application_lastt/drop_down.dart';

import 'package:flutter_application_lastt/search.dart';

// ignore: must_be_immutable
class MyHomePage extends StatefulWidget {
  // ignore: library_private_types_in_public_api
  _MyHomePageState stateClass = _MyHomePageState();

  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List dataseriesListForMyHomePage = [];
  String result1 = "Search a City in order to see information";
  String result2 = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather Forecast"),
        actions: [
          IconButton(
              onPressed: () {
                showSearch(
                    context: context,
                    delegate: MySearchDelegate((String cityData1) {
                      setState(() {
                        result1 = cityData1;
                      });
                    }, (List data) {
                      setState(() {
                        dataseriesListForMyHomePage.clear();
                        for (var i = 0; i < data.length; i++) {
                          (dataseriesListForMyHomePage.add(data[i]));
                        }

                        result2 = dataseriesListForMyHomePage[0].toString();
                      });
                    }));
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: Center(
        child: Column(children: [
          Container(
              color: Colors.amber,
              width: 365.0,
              height: 55.0,
              child: Center(child: Text(result1))),
          Container(
              color: Colors.blue,
              width: 365.0,
              height: 205.0,
              child: Center(child: Text(result2))),
          if (dataseriesListForMyHomePage.length == 24)
            (DropDown(dataseriesForThisClass: dataseriesListForMyHomePage)),
        ]),
      ),
    );
  }
}
