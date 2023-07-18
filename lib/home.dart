import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kumarpandule/menu/menu_list.dart';
import 'package:kumarpandule/widgets/Package_card.dart';
import 'package:kumarpandule/widgets/current_booking_card.dart';
import 'package:kumarpandule/widgets/nanny_card.dart';
import 'package:kumarpandule/widgets/profile_card.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

String stringResponse = '';
Map mapResponse = {};
Map dataResponse = {};
List listResponse = [];

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var isLoading = false;

  @override
  void initState() {
      Timer.run(() {
      try {
        InternetAddress.lookup('google.com').then((result) {
          if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
          } else {
            _showDialog(); // show dialog
          }
        }).catchError((error) {
          _showDialog(); // show dialog
        });
      } on SocketException catch (_) {
        _showDialog(); // show dialog
      }
    });
    apicall();
    super.initState();
  }

  Future apicall() async {
    http.Response response;
    response = await http.get(Uri.parse('https://cgprojects.in/flutter/'));
    if (response.statusCode == 200) {
      setState(() {
        stringResponse = response.body;
        mapResponse = jsonDecode(stringResponse);
        dataResponse = mapResponse['current_bookings'];
        listResponse = mapResponse['packages'];
        isLoading = true;
      });
    } else {
      print(response.statusCode);
    } //add your api here and remove the []
  }

    void _showDialog() {
    // dialog implementation
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Internet needed!', style: TextStyle(color: Colors.pink, fontSize: 18, fontWeight: FontWeight.w600)),
        content: const Text('You may want to exit the app here', style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w400)),
        actions: <Widget>[
          Center(
            child: ElevatedButton(
              onPressed: () => SystemNavigator.pop(), 
              child: const Text("EXIT"),),
          )
        ],
      ),
    );
  }

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Packages',
      style: optionStyle,
    ),
    Text(
      'Index 2: Bookings',
      style: optionStyle,
    ),
    Text(
      'Index 3: profile',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final GlobalKey<SideMenuState> menuBarKey = GlobalKey<SideMenuState>();
  @override
  Widget build(BuildContext context) {
    return SideMenu(
      key: menuBarKey,
      menu: MenuList(menuKey: menuBarKey),
      background: Colors.white,
      type: SideMenuType.shrinkNSlide,
      closeIcon: const Icon(Icons.close, color: Colors.pink),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          shadowColor: Colors.white,
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Colors.white,
          actions: [
            IconButton(
              splashColor: Colors.white,
              iconSize: 32,
              onPressed: () {
                if (menuBarKey.currentState!.isOpened) {
                  menuBarKey.currentState!.closeSideMenu();
                } else {
                  menuBarKey.currentState!.openSideMenu();
                }
              },
              icon: const Icon(Icons.menu, color: Colors.pink),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ProfileCard(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: NannyCard(),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
                child: Text(
                  'Your Current Bookings',
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo[900]),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
                child: Visibility(
                    visible: isLoading,
                    child: CurrentBooking(
                      label: dataResponse['package_label'].toString(),
                      from_date: dataResponse['from_date'].toString(),
                      from_time: dataResponse['from_time'].toString(),
                      to_date: dataResponse['to_date'].toString(),
                      to_time: dataResponse['to_time'].toString(),
                    ),
                    replacement: const Center(
                      child: CircularProgressIndicator(),
                    )),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
                child: Text(
                  'Packages',
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo[900]),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Column(
                    children: [
                      Visibility(
                          visible: isLoading,
                          child: ListView.builder(
                              itemCount: listResponse.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return PackageCard(
                                    id: listResponse[index]['id'],
                                    name: listResponse[index]['package_name'],
                                    price: listResponse[index]['price'],
                                    description: listResponse[index]
                                        ['description']);
                              }),
                          replacement: const Center(
                            child: CircularProgressIndicator(),
                          )),
                    ],
                  ))
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.sell),
              label: 'Packages',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.alarm),
              label: 'Bookings',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.pink[300],
          unselectedItemColor: Colors.grey,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
