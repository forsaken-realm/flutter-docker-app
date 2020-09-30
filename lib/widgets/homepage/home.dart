import 'package:authencicationtest/main.dart';
import 'package:authencicationtest/widgets/Linux_performance/performance.dart';
import 'package:authencicationtest/widgets/docker_ps/docker_ps.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'home_body.dart';
import 'package:flutter_icons/flutter_icons.dart';

final Color backgroundColor = Color(0xFF4A4A58);

class MyhomePage extends StatefulWidget {
  @override
  _MyhomePageState createState() => _MyhomePageState();
}

class _MyhomePageState extends State<MyhomePage> {
  final List<Widget> homebody = <Widget>[
    Mybody(),
    Page1(),
    Performance(),
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Docker'),
        backgroundColor: Colors.black,
        actions: [
          IconButton(icon: Icon(Icons.settings), onPressed: () {}),
        ],
      ),
      body: homebody.elementAt(_currentIndex),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        showElevation: true,
        backgroundColor: Colors.black,
        itemCornerRadius: 8,
        curve: Curves.easeInBack,
        onItemSelected: (index) => setState(() {
          _currentIndex = index;
        }),
        items: [
          BottomNavyBarItem(
            icon: Icon(
              AntDesign.home,
              color: Colors.white,
            ),
            title: Text('Home'),
            activeColor: Colors.amber[900],
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(
              Icons.dashboard,
              color: Colors.white,
            ),
            title: Text('DashBoard'),
            activeColor: Colors.amber[900],
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(
              AntDesign.info,
              color: Colors.white,
            ),
            title: Text(
              'Help ',
            ),
            activeColor: Colors.amber[900],
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
