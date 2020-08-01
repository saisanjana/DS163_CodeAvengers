import 'package:flutter/material.dart';
import './screens/nav_screen.dart';
import './screens/auth_screen.dart';
import './calls_and_msgs_service.dart';
import 'package:get_it/get_it.dart';
import './screens/match_game.dart';
GetIt locator = GetIt();

void setupLocator() {
  locator.registerSingleton(CallsAndMessagesService());
}

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AuthScreen(),
      routes: {
        NavScreen.routeName: (ctx) => NavScreen(),
        MatchGame.routeName:(ctx)=>MatchGame(),
      },
    );
  }
}
