import 'package:final_task/Widget/Country/Countries.dart';
import 'package:flutter/material.dart';

import '../Mehtods.dart';

class Continent extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Continent> {
  int _selectedIndex = 0;

  // define color of theme
  bool _isDark = false;
  ThemeData _light = ThemeData.light().copyWith(
    primaryColor: Colors.indigo,
  );
  ThemeData _dark = ThemeData.dark().copyWith(
    primaryColor: Colors.blueGrey,
  );

  // index of icon in bottom
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // switch between colors
  void toggleSwitch(bool value) {
    if (_isDark == false) {
      setState(() {
        _isDark = true;
      });
      print('Switch Button is ON');
    } else {
      setState(() {
        _isDark = false;
      });
      print('Switch Button is OFF');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: _dark,
      theme: _light,
      // to make theme dark or light
      themeMode: _isDark ? ThemeMode.dark : ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("The World"),
              SizedBox(
                width: 5,
              ),
              Image.asset('images/world.png'),
            ],
          ),
          backgroundColor: Colors.indigo,
        ),
        body: Container(
          color: Colors.black,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: FutureBuilder<Map<String, dynamic>>(
              future: Data().loadAllData_Continents(),
              //***************************************************
              // Favourite screen
              builder: (context, snapshot) {
                //  print(list);
                if (snapshot.data != null) {
                  // keys of continents like{AF,OS_UR)
                  Iterable<String> list = snapshot.data.keys;
                  print(list.toString());
//
                  return Container(
                    color: Colors.black,
                    padding: EdgeInsets.only(top: 40),
                    child: ListView(
                      // loop on data
                      children: List.generate(snapshot.data.length, (index) {
                        return Center(
                          child: Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.all(10),
                            width: 230,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white),
                            child: InkWell(
                              splashColor: Colors.white,
                              //highlightColor: Colors.blue,
                              child: Text(
                                '${snapshot.data.values.elementAt(index).toString()}',
                                style: TextStyle(
                                    color: Colors.indigo,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              onTap: () {
                                // to translate to another screen (Countries)
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Countries(
                                      con_key: list.elementAt(index),
                                      con_name:
                                          snapshot.data.values.elementAt(index),
//                            print(snapshot.data.values.elementAt(index));
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      }),
                    ),
                  );
                }
              }),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favourite',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ),
        drawer: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text("Abdullah Mamdouh"),
                accountEmail: Text("abdullah.mamdouh2000@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.orange,
                  child: Text(
                    "A",
                    style: TextStyle(fontSize: 40.0),
                  ),
                ),
              ),
              Container(
                width: 15,
                height: 20,
                child: Switch(
                  onChanged: toggleSwitch,
                  value: _isDark,
                  activeColor: Colors.blue,
                  activeTrackColor: Colors.white,
                  inactiveThumbColor: Colors.redAccent,
                  inactiveTrackColor: Colors.black,
                ),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text("Home"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.favorite),
                title: Text("Favourite"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.contacts),
                title: Text("Contact Us"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
