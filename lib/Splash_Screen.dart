import 'dart:async';

import 'package:flutter/material.dart';

import 'Widget/Continent/Continents.dart';

class Splash extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 5),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Continent())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      width: double.infinity,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          color: Colors.black,
          child: Image.asset(
            "images/c_1.png",
            scale: 1.0,
          ),
        ),
        SizedBox(
          height: 16,
        ),
        Text(" 7 Continents",
            style: TextStyle(color: Colors.white, fontSize: 30))
      ]),
    );
  }
}
