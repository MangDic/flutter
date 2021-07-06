
import 'package:flutter/material.dart';
import 'package:todayschool/Screens/HomeScreen.dart';
import 'package:todayschool/Screens/ChatScreen.dart';
import 'package:todayschool/Screens/SearchScreen.dart';
import 'package:todayschool/Screens/SettingScreen.dart';



class MainPages extends StatefulWidget {
  const MainPages({Key? key}) : super(key: key);

  @override
  State<MainPages> createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MainPages> {
  int _selectedIndex = 0;
  static List selectedScreen = <Widget>[
    HomeScreen(), ChatScreen(), SearchScreen(), SettingScreen(),
  ];
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: selectedScreen[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blueAccent,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '홈',
            //backgroundColor: Colors.blueAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: '커뮤니티',
            //backgroundColor: Colors.blueAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '학원검색',
            //backgroundColor: Colors.blueAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: '설정',
            //backgroundColor: Colors.blueAccent,
          ),
        ],
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.black12,
        selectedItemColor: Colors.blueAccent,
        showUnselectedLabels: true,
        onTap: _onItemTapped,
      ),
    );
  }
}
