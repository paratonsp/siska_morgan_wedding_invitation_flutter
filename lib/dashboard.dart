// ignore_for_file: use_key_in_widget_constructors, avoid_unnecessary_containers, prefer_const_constructors

import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:siska_morgan_wedding_invitation_flutter/pagefour.dart';
import 'package:siska_morgan_wedding_invitation_flutter/pageone.dart';
import 'package:siska_morgan_wedding_invitation_flutter/pagethree.dart';
import 'package:siska_morgan_wedding_invitation_flutter/pagetwo.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  static final List<Widget> _widgetOptions = <Widget>[
    PageOne(),
    PageTwo(),
    PageThree(),
    PageFour(),
  ];

  int _selectedIndex = 0;

  void _handleIndexChanged(int i) {
    setState(() {
      _selectedIndex = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: DotNavigationBar(
          margin: EdgeInsets.only(left: 10, right: 10),
          paddingR: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
          currentIndex: _selectedIndex,
          dotIndicatorColor: Colors.grey,
          unselectedItemColor: Colors.grey,
          enablePaddingAnimation: false,
          onTap: _handleIndexChanged,
          items: [
            DotNavigationBarItem(
              icon: Icon(Icons.home),
              selectedColor: Color(0xff73544C),
            ),
            DotNavigationBarItem(
              icon: Icon(Icons.location_on),
              selectedColor: Color(0xff73544C),
            ),
            DotNavigationBarItem(
              icon: Icon(Icons.image),
              selectedColor: Color(0xff73544C),
            ),

            /// Profile
            DotNavigationBarItem(
              icon: Icon(Icons.card_giftcard),
              selectedColor: Color(0xff73544C),
            ),
          ],
        ),
      ),
    );
  }
}
