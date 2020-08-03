import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:protecto/screens/auth_screen.dart';
import 'package:protecto/screens/chat_screen.dart';
import 'package:protecto/screens/nav_screen.dart';
import 'package:protecto/screens/offline_screen.dart';
import 'package:protecto/screens/reports_pending.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       appBarTheme: AppBarTheme(
         color: Colors.white
       ),
        primarySwatch: Colors.blue,
        
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
     // home:NavScreen(),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.onAuthStateChanged,
        builder: (ctx,snap){
            if(snap.connectionState==ConnectionState.waiting) {
              return CircularProgressIndicator();
            }
            if(snap.hasData){

              return NavScreen();
            }else return AuthScreen();
      }),
      routes: {
        OfflineScreen.routeName:(ctx)=>OfflineScreen(),
        NavScreen.routeName:(ctx)=> NavScreen(),
        ChatScreen.routeName:(ctx)=>ChatScreen(),
        ReportsPending.routeName:(ctx)=>ReportsPending()
      },
    );
  }
}

