import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:protecto/screens/home_screen.dart';
import './discussions_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:protecto/screens/dummy_screen.dart';
import './call_screen.dart';
import './games_screen.dart';
class NavScreen extends StatelessWidget {
  static const routeName = "navscreen";
  final List<Widget> _screens=[
    HomeScreen(),
    GamesScreen(),
    DiscussionsScreen(),
    CallScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: 0,
      child: Scaffold(
        body: FutureBuilder(future: FirebaseAuth.instance.currentUser(),builder: (ctx,snap){
          if(snap.connectionState==ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }
          if(snap.data.isEmailVerified==true){
            return TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: _screens);
          }
          return Container(
            margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top+10),
            height: MediaQuery.of(context).size.height,
            child:Center(
              child: Column(
                children: <Widget>[
                  Text("You can only continue after verifying your email."),
                  Text("Please verify your email and login again!"),
                  RaisedButton(onPressed: (){
                    FirebaseAuth.instance.signOut();
                  },child: Text("Okay!"),)
                ],
              ),
            )
          );
        }),



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