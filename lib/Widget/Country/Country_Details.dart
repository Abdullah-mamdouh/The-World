import 'package:final_task/Model/Language.dart';
import 'package:flutter/material.dart';

import '../Mehtods.dart';

class Country_Details extends StatelessWidget {
  Country_Details({Key key, @required this.data, @required this.continent_name})
      : super(key: key);
  Map data;
  String continent_name;
  //Map languages = Data().load_Languages() as Map;
  // print(languages);
  List<MapEntry> countries;
  //len.add(countries[0]);

  @override
  Widget build(BuildContext context) {
    //print(Data().load_Languages('ar'));
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.indigo,
          title: Center(
            child: Text(
              'Details of ${data['name']} ${data['emoji']}',
              style: TextStyle(color: Colors.yellow, fontSize: 25),
            ),
          )),
      body: //MyHome(languages: data['languages']),

          SafeArea(
        child: Container(
          //height: 100,width: 100,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.black,

          child: ListView(
            children: [
              //************Name's country************* 1
              _getData('name'),

              //************native's country************* 1
              _getData('native'),

              //************Phone's country*************
              _getData('phone'),

              //************continent's country*************
              _getData('continent'),

              //************capital's country*************
              _getData('capital'),

              //************currency's country*************
              _getData('currency'),

              //************emoji's country*************
              _getData('emoji'),

              //************emojiU's country*************
              _getData('emojiU'),

              //************Languages's country Button*************
              GestureDetector(
                onTap: () {
                  print(data['name']);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyHome(
                        languages: data['languages'],
                        name: data['name'],
                        emoji: data['emoji'],
                      ),
                    ),
                  );
                },
                child: Container(
                  child: Center(
                    child: Text(
                      'Languages ==>',
                      style: TextStyle(
                          color: Colors.indigo,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  padding: EdgeInsets.all(30),
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
            ],
          ),
// ),
        ),
      ),
    );
  }

// Method that draw shape of details
  Widget _getData(String name) {
    return Container(
      child: Center(
          child: Text(
        name != 'continent'
            ? 'The $name : ${data['$name']}'
            : 'The $name : ${continent_name}',
        style: TextStyle(
            color: Colors.indigo, fontSize: 20, fontWeight: FontWeight.bold),
      )
//
          ),
      padding: EdgeInsets.all(30),
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)),
    );
  }

//   List len() {
//
//                List<MapEntry> countries;
//                List lang;
//                print(lang.length);
//                return lang;
//}

}

//Center(
//child: Text('The : ${name[index]}', style: TextStyle(
//color: Colors.white,
//fontSize: 20,
//fontWeight: FontWeight.bold),),
//),
