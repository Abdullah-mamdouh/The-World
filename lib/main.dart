import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'package:splashscreen/splashscreen.dart';

import 'Model/Country.dart';
import 'Model/Language.dart';
import 'Splash_Screen.dart';
import 'Widget/Continent/Continents.dart';
import 'Widget/Country/Favourite.dart';
import 'Widget/Mehtods.dart';

void main() {
  runApp(MyHomePage());
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List<Widget> _widgetOptions = [
    Continent(),
    Favourite(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  bool _isDark = false;
  ThemeData _light = ThemeData.light().copyWith(
    primaryColor: Colors.indigo,
  );
  ThemeData _dark = ThemeData.dark().copyWith(
    primaryColor: Colors.blueGrey,
  );

  @override
  Widget build(BuildContext context) {
    //print(Data().loadAllData_Continents()['AF'].toString());
    return MaterialApp(
      title: 'Flutter Demo',
      darkTheme: _dark,
      theme: _light,
      // to make theme dark or light
      themeMode: _isDark ? ThemeMode.dark : ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: Text("The World"),
            centerTitle: true,
            backgroundColor: Colors.indigo,
          ),
          body: Splash(),
          ),
    );
  }
}
