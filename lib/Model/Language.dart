import 'dart:convert';
import 'package:final_task/Widget/Mehtods.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart' as rootBundle;

import 'Country.dart';

class MyHome extends StatelessWidget {
  MyHome(
      {Key key,
      @required this.languages,
      @required this.name,
      @required this.emoji})
      : super(key: key);
  List languages;
  String name;
  String emoji;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.indigo,
          title: Center(
            child: Text(
              'Languages of ${name} ${emoji}',
              style: TextStyle(color: Colors.yellow, fontSize: 25),
            ),
          )),
      body: FutureBuilder<Map>(

          //load data from json file in future
          future: Data().load_Languages(),
          builder: (context, snapshot) {
            // if exist error
            if (snapshot.data == null) {
              return Center(child: Text("error"));
            }
            if (snapshot.data != null) {
              if (snapshot.hasData) {
//
                List<MapEntry> countries_languages;
                List<MapEntry> len = [];
                // loop to fech data that equal keys's data that come from countrty
                for (int i = 0; i < languages.length; i++) {
                  countries_languages = snapshot.data.entries
                      .where((element) => element.key == languages[i])
                      .toList();
                  // add to list
                  len.add(countries_languages[0]);
                }
                //  print(len.length.toString()+" "+languages.length.toString());
                return Container(
                  color: Colors.black,
                  child: ListView(
                      children: List.generate(len.length, (index) {
                    print((len[index].value['name']));
                    //return Text('${snapshot.data.toString()}');
                    return Container(
                      child: Center(
                        child: Text(
                          '${len[index].value['name'].toString()}',
                          style: TextStyle(
                              color: Colors.indigo,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      padding: EdgeInsets.all(30),
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)),
                    );
                  })),
                );
              }
            }
          }),
    );
  }
}
