import 'package:flutter/material.dart';
import './discussions_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:protecto/screens/dummy_screen.dart';
import './call_screen.dart';
class NavScreen extends StatelessWidget {
  static const routeName = "navscreen";
  final List<Widget> _screens=[
    DummyScreen(),
    DummyScreen(),
    DiscussionsScreen(),
    CallScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: 0,
      child: Scaffold(
       
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: _screens),
        bottomNavigationBar: TabBar(tabs: <Widget>[
          Tab(
            icon:Icon(FontAwesomeIcons.home),
          ),
          Tab(
            icon:Icon(FontAwesomeIcons.gamepad),
          ),
          Tab(
            icon:Icon(FontAwesomeIcons.users),
          ),
          Tab(
            icon:Icon(FontAwesomeIcons.phone),
          )
        ],
        unselectedLabelColor: Color.fromRGBO(0, 0, 139, 1),
        labelColor: Colors.green,
        indicatorColor: Colors.black,
        ),
      ),
    );
  }
}