import 'dart:convert';

import 'package:final_task/Model/Country.dart';
import 'package:flutter/services.dart';

class Data {
  List data;
//  static Future<String> jsonData() async {
//     String response = await rootBundle.loadString('json/data.json');
//    Map data = json.decode(response);
//    return response;
//  }
  Future<String> loadName_Continents(String val) async {
    final String response = await rootBundle.loadString('json/data.json');
    Map user = json.decode(response);
    String name = user["continents"]['$val'];
    return name;
  }

  Future<Map> loadAllData_Countries() async {
    final String response = await rootBundle.loadString('json/data.json');
    Map user = json.decode(response);
    Map name = user["countries"];
//    await name.forEach((key, value) {
//      data.add(value);
//    });
    return name;
  }

  Future<Map<String, dynamic>> loadAllData_Continents() async {
    final String response = await rootBundle.loadString('json/data.json');
    Map user = json.decode(response);
    Map<String, dynamic> name = user["continents"];
//    await name.forEach((key, value) {
//      data.add(value);
//    });
    return name;
  }

  Future<Map> load_Languages() async {
    final String response = await rootBundle.loadString('json/data.json');
    Map user = json.decode(response);
    Map name = user["languages"];
//    await name.forEach((key, value) {
//      data.add(value);
//    });
    return name;
  }
}
