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
          Center(
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      borderOnForeground: true,
                      elevation: 5,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset("assets/images/dugong.jpeg"),
                          ),
                          const ListTile(
                            title: Text(
                              'Dugong',
                              style: TextStyle(fontSize: 20.0),
                            ),
                            subtitle: Text(
                              "Yesterday , at midnight around 12 30 am, dugong poachers where identified and arrested by andaman police.",
                              style: TextStyle(fontSize: 15.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
        ],),
      ),
    );
  }
}
