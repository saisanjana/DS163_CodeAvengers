import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(size.width * 0.05),
        margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child:Column(children: <Widget>[
          
        ],),
      ),
    );
  }
}
