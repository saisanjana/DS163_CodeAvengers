import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthWidget extends StatefulWidget {
  @override
  _AuthWidgetState createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
 
  TextEditingController tx1= new TextEditingController();
  TextEditingController tx2= new TextEditingController(); 
  void _logIn() async {
    if(tx1.text.length<7 || tx2.text.length<6){
        Scaffold.of(context).showSnackBar(SnackBar(content: Text('Please Check Your credentials'),));
        return;
    }

    final user = (await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: tx1.text, password: tx2.text))
        .user;
  }

  @override 
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Center(child: Image.asset("assets/images/logo.png",)),
        Center(
          child: Container(
            
            width: size.width*0.8,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    height: size.height * 0.07,
                    width: size.width * 0.7,
                    child: ListTile(
                      leading: ImageIcon(
                        AssetImage("assets/images/mail_icon.png"),
                        color: Colors.white,
                        size: 40,
                      ),
                      title: TextField(
                        controller: tx1,
                        decoration: InputDecoration(
                          hintText: "Email",
                          hintStyle: TextStyle(color: Colors.white70, fontSize: 19),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    //padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    height: size.height * 0.07,
                    width: size.width * 0.7,
                    child: ListTile(
                      leading: ImageIcon(
                        AssetImage("assets/images/password_icon.png"),
                        color: Colors.white,
                        size: 35,
                      ),
                      title: TextField(
                        controller: tx2,
                        decoration: InputDecoration(
                          hintText: "Password",
                          hintStyle: TextStyle(color: Colors.white70, fontSize: 19),
                          border: InputBorder.none,
                        ),
                        obscureText: true,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: _logIn,
                    child: Image.asset("assets/images/login_button.png"),
                  ),
                ],
              )),
        ),
      ],
    );
  }
}
