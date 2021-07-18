import 'package:final_task/Widget/Mehtods.dart';
import 'package:flutter/material.dart';

import 'Country_Details.dart';

class Countries extends StatelessWidget {
  String con_key;
  String con_name;

  Countries({Key key, @required this.con_key, @required this.con_name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.indigo,
          title: Padding(
            padding: EdgeInsets.only(left: 60),
            child: Text(
              "Countries",
              style: TextStyle(color: Colors.yellow, fontSize: 25),
            ),
          )),
      body: Container(
        child: FutureBuilder<Map>(
            //load data
            future: Data().loadAllData_Countries(),
            builder: (context, snapshot) {
              if (snapshot.data != null) {
                // loop to fech all countries that inside continent
                List<MapEntry> countries = snapshot.data.entries
                    .where((element) => element.value['continent'] == con_key)
                    .toList();
                //print(countries[0].value['name'].toString());
                return Container(
                  color: Colors.black,
                  child: ListView(

                      // show name of countries that obtain from loop
                      children: List.generate(countries.length, (index) {
                    print(con_name);
                    return GestureDetector(
                      // when push show detaites of country
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Country_Details(
                                      data: countries[index].value,
                                      //continent_name:con_name,
                                    )));
                      },
                      child: Container(
                        child: Center(
                          child: Text(
                            '${countries[index].value['name'].toString()}',
                            style: TextStyle(
                                color: Colors.indigo,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        padding: EdgeInsets.all(20),
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    );
                  })),
                );
              }
            }),
      ),
    );
  }
}
