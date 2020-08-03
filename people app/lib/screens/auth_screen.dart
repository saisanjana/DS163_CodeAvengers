import 'package:flutter/material.dart';
import '../widgets/auth_widget.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          //height: size.height,
          width: size.width,
          padding: EdgeInsets.all(size.width*0.01),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(30),
                child: Image.asset(
                  "assets/images/logo_png.png",
                  height: size.height*0.4,
                  width: size.width*0.8,
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Container(
                 height: size.height*0.6,
                 width: size.width*0.8,

                child: AuthWidget(),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
