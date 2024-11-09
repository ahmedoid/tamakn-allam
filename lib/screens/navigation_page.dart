// Bottom Navigation Bar (can be added to other screens if needed)
import 'package:flutter/material.dart';
import 'package:makeen/screens/dashboard_page.dart';
import 'package:makeen/screens/story_page.dart';
import 'package:makeen/screens/welcome_page.dart';

class MyNavigationBar extends StatefulWidget {
  const MyNavigationBar({super.key});

  @override
  _MyNavigationBarState createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    WelcomePage(
      userName: 'علام',
    ),
    StoryPage(),
    // achvment page
    DashboardPage(),
    Text('Profile Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  ];
  static const List<String> _appBarTitles = <String>[
    'Home',
    'Question',
    'Achievement',
    'Profile',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _selectedIndex != 0
          ? AppBar(
              title: Text(_appBarTitles.elementAt(_selectedIndex)),
            )
          : null,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          backgroundColor: Theme.of(context).primaryColor,
          selectedIconTheme: IconThemeData(color: Colors.white, size: 40),
          unselectedIconTheme: IconThemeData(color: Colors.white, size: 30),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: ('Search'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.emoji_events),
              label: ('Achievement'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: ('Profile'),
            ),
          ],
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          iconSize: 40,
          onTap: _onItemTapped,
          elevation: 5),
    );
  }
}
